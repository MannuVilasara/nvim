local now_playing = "♫ No music playing"
local playerctl_job = nil

local function start_playerctl_follow()
    if playerctl_job then
        return
    end

    playerctl_job = vim.fn.jobstart({
        "playerctl",
        "metadata",
        "--follow",
        "--format",
        "{{artist}}|||{{title}}",
    }, {
        stdout_buffered = false,
        on_stdout = function(_, data)
            if not data then
                return
            end

            for _, line in ipairs(data) do
                if line and line ~= "" then
                    local artist, title = line:match("^(.-)|||(.+)$")
                    if artist and title then
                        artist = artist:gsub("^%s*(.-)%s*$", "%1")
                        title = title:gsub("^%s*(.-)%s*$", "%1")
                        now_playing = "♫ Now Playing: " .. artist .. " - " .. title
                    else
                        now_playing = "♫ No music playing"
                    end
                    vim.schedule(function()
                        if vim.bo.filetype == "snacks_dashboard" then
                            pcall(function()
                                Snacks.dashboard()
                            end)
                        end
                    end)
                end
            end
        end,
        on_exit = function()
            playerctl_job = nil
        end,
    })
end

return {
    "folke/snacks.nvim",
    dependencies = {
        "echasnovski/mini.icons",
    },
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = {
            enabled = true,
            preset = {
                header = [[
                mannu                         
       ████ ██████           █████      ██
      ███████████             █████ 
      █████████ ███████████████████ ███   ███████████
     █████████  ███    █████████████ █████ ██████████████
    █████████ ██████████ █████████ █████ █████ ████ █████
  ███████████ ███    ███ █████████ █████ █████ ████ █████
 ██████  █████████████████████ ████ █████ █████ ████ ██████
        ]],
            },
            sections = {
                { section = "header" },
                { section = "keys",  gap = 1, padding = 2 },
                function()
                    local rest = now_playing:gsub("^♫ Now Playing:%s*", "")
                    if rest ~= now_playing then
                        local artist, title = rest:match("^(.-)%s+%-%s+(.+)$")
                        if artist and title then
                            return {
                                align = "center",
                                text = {
                                    { "♫ Now Playing: ", hl = "SnacksDashboardIcon" },
                                    { artist, hl = "Special" },
                                    { " - ", hl = "SnacksDashboardDesc" },
                                    { title, hl = "String" },
                                },
                            }
                        end
                    end

                    return {
                        align = "center",
                        text = {
                            { now_playing, hl = "Comment" },
                        },
                    }
                end,
                {
                    text = "─",
                    align = "center",
                    hl = "SnacksDashboardSpecial",
                },
                { section = "startup", padding = 1 },
            },
        },
        indent = { enabled = true },
        input = { enabled = true },
        git = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        win = { enabled = true },
        styles = {
            notification = {
                wo = { wrap = true },
            },
        },
    },
    config = function(_, opts)
        require("snacks").setup(opts)
        start_playerctl_follow()
    end,
    keys = {
        {
            "<leader>sf",
            function()
                Snacks.scratch()
            end,
            desc = "Toggle Scratch Buffer",
        },
        {
            "<leader>S",
            function()
                Snacks.scratch.select()
            end,
            desc = "Select Scratch Buffer",
        },
        {
            "<leader>gl",
            function()
                Snacks.lazygit.log_file()
            end,
            desc = "Lazygit Log (cwd)",
        },
        {
            "<leader>lg",
            function()
                Snacks.lazygit()
            end,
            desc = "Lazygit",
        },
        {
            "<C-p>",
            function()
                Snacks.picker.pick("files")
            end,
            desc = "Find Files",
        },
        {
            "<leader><leader>",
            function()
                Snacks.picker.recent()
            end,
            desc = "Recent Files",
        },
        {
            "<leader>fb",
            function()
                Snacks.picker.buffers()
            end,
            desc = "Buffers",
        },
        {
            "<leader>fg",
            function()
                Snacks.picker.grep()
            end,
            desc = "Grep Files",
        },
        {
            "<leader>ee",
            function()
                Snacks.explorer.open()
            end,
            desc = "Explorer",
        },
        {
            "<leader>p",
            function()
                Snacks.picker.pick("commands")
            end,
            desc = "Command Palette",
        },
        {
            "<leader>fh",
            function()
                Snacks.picker.help()
            end,
            desc = "Help Pages",
        },
        {
            "<leader>fc",
            function()
                Snacks.picker.colorschemes()
            end,
            desc = "Colorschemes",
        },
        {
            "<leader>fk",
            function()
                Snacks.picker.keymaps()
            end,
            desc = "Keymaps",
        },
    },
}
