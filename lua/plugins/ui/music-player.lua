return {
	"folke/snacks.nvim",
	opts = function(_, opts)
		-- Simple Music Player Module
		local M = {}
		M.win = nil
		M.timer = nil

		-- Get current track info from playerctl
		function M.get_track_info()
			local info = {}

			-- Get metadata
			local commands = {
				artist = "playerctl metadata artist 2>/dev/null",
				title = "playerctl metadata title 2>/dev/null",
				album = "playerctl metadata album 2>/dev/null",
				status = "playerctl status 2>/dev/null",
				position = "playerctl position 2>/dev/null",
				length = "playerctl metadata mpris:length 2>/dev/null",
			}

			for key, cmd in pairs(commands) do
				local handle = io.popen(cmd)
				if handle then
					local result = handle:read("*a"):gsub("^%s*(.-)%s*$", "%1")
					handle:close()
					info[key] = result ~= "" and result or "Unknown"
				end
			end

			-- Convert position and length to seconds
			if info.position and info.position ~= "Unknown" then
				info.position_sec = tonumber(info.position) or 0
			end

			if info.length and info.length ~= "Unknown" then
				-- mpris:length is in microseconds
				info.length_sec = tonumber(info.length) / 1000000 or 0
			end

			return info
		end

		-- Format time in mm:ss
		function M.format_time(seconds)
			if not seconds or seconds == 0 then
				return "0:00"
			end
			local mins = math.floor(seconds / 60)
			local secs = math.floor(seconds % 60)
			return string.format("%d:%02d", mins, secs)
		end

		-- Create progress bar
		function M.create_progress_bar(current, total, width)
			width = width or 30
			if not current or not total or total == 0 then
				return string.rep("-", width)
			end

			local progress = math.min(current / total, 1)
			local filled = math.floor(progress * (width - 1))
			local empty = width - 1 - filled

			return string.rep("━", filled) .. "╸" .. string.rep("─", empty)
		end

		-- Helper function to pad string to exact width
		local function pad_center(str, width)
			local len = vim.fn.strwidth(str)
			if len >= width then
				return str:sub(1, width)
			end
			local padding_left = math.floor((width - len) / 2)
			local padding_right = width - len - padding_left
			return string.rep(" ", padding_left) .. str .. string.rep(" ", padding_right)
		end

		-- Helper function to pad string to exact width (left align)
		local function pad_left(str, width)
			local len = vim.fn.strwidth(str)
			if len >= width then
				return str:sub(1, width)
			end
			return str .. string.rep(" ", width - len)
		end

		-- Update the player UI
		function M.update_ui()
			if not M.win or not M.win:valid() then
				return
			end

			local info = M.get_track_info()
			local lines = {}
			local w = 60 -- Inner width

			-- Top border
			table.insert(lines, "╔" .. string.rep("═", w) .. "╗")
			table.insert(lines, "║" .. string.rep(" ", w) .. "║")

			-- Track info
			local title = info.title ~= "Unknown" and info.title or "No Track"
			local artist = info.artist ~= "Unknown" and info.artist or "Unknown Artist"
			local track = title .. " - " .. artist
			table.insert(lines, "║" .. pad_center(track, w) .. "║")
			
			table.insert(lines, "║" .. string.rep(" ", w) .. "║")
			table.insert(lines, "╠" .. string.rep("═", w) .. "╣")
			table.insert(lines, "║" .. string.rep(" ", w) .. "║")

			-- Progress
			local curr = M.format_time(info.position_sec)
			local total = M.format_time(info.length_sec)
			local bar = M.create_progress_bar(info.position_sec, info.length_sec, 38)
			local icon = info.status == "Playing" and "▶" or info.status == "Paused" and "⏸" or "⏹"
			
			local prog = curr .. " " .. bar .. " " .. total .. " " .. icon
			table.insert(lines, "║" .. pad_center(prog, w) .. "║")
			
			table.insert(lines, "║" .. string.rep(" ", w) .. "║")
			table.insert(lines, "╠" .. string.rep("═", w) .. "╣")
			table.insert(lines, "║" .. string.rep(" ", w) .. "║")

			-- Controls
			local ctrl = "[p] Play/Pause   [n] Next   [b] Previous   [q] Quit"
			table.insert(lines, "║" .. pad_center(ctrl, w) .. "║")
			
			table.insert(lines, "║" .. string.rep(" ", w) .. "║")
			table.insert(lines, "╚" .. string.rep("═", w) .. "╝")

			-- Update buffer
			vim.bo[M.win.buf].modifiable = true
			vim.api.nvim_buf_set_lines(M.win.buf, 0, -1, false, lines)
			vim.bo[M.win.buf].modifiable = false
		end

		-- Toggle music player UI
		function M.toggle()
			if M.win and M.win:valid() then
				M.close()
				return
			end

			M.win = Snacks.win({
				position = "float",
				width = 62,
				height = 14,
				border = "none",
				title = "",
				zindex = 50,
				backdrop = 60,
				bo = {
					modifiable = true,
					readonly = false,
				},
				wo = {
					winblend = 0,
					winhighlight = "Normal:Normal",
				},
				keys = {
					q = function()
						M.close()
					end,
					p = function()
						vim.fn.system("playerctl play-pause")
						vim.defer_fn(function()
							M.update_ui()
						end, 100)
					end,
					n = function()
						vim.fn.system("playerctl next")
						vim.defer_fn(function()
							M.update_ui()
						end, 500)
					end,
					b = function()
						vim.fn.system("playerctl previous")
						vim.defer_fn(function()
							M.update_ui()
						end, 500)
					end,
				},
			})

			-- Initial update
			M.update_ui()

			-- Auto-update every 1 second for real-time progress
			M.timer = vim.loop.new_timer()
			M.timer:start(
				1000,
				1000,
				vim.schedule_wrap(function()
					M.update_ui()
				end)
			)
		end

		-- Close music player
		function M.close()
			if M.timer then
				M.timer:stop()
				M.timer:close()
				M.timer = nil
			end

			if M.win and M.win:valid() then
				M.win:close()
				M.win = nil
			end
		end

		-- Player controls (can be called from keybindings)
		function M.play_pause()
			vim.fn.system("playerctl play-pause")
		end

		function M.next()
			vim.fn.system("playerctl next")
		end

		function M.previous()
			vim.fn.system("playerctl previous")
		end

		-- Make module globally available
		_G.MusicPlayer = M

		return opts
	end,

	keys = {
		-- Music player UI toggle
		{
			"<leader>mp",
			function()
				_G.MusicPlayer.toggle()
			end,
			desc = "Toggle Music Player UI",
		},
		-- Quick controls without opening UI
		{
			"<leader>m<space>",
			function()
				_G.MusicPlayer.play_pause()
			end,
			desc = "Play/Pause Music",
		},
		{
			"<leader>mn",
			function()
				_G.MusicPlayer.next()
			end,
			desc = "Next Track",
		},
		{
			"<leader>mb",
			function()
				_G.MusicPlayer.previous()
			end,
			desc = "Previous Track",
		},
	},
}
