return {
    {
        -- 1. Plugin Repository/Name
        "brenoprata10/nvim-highlight-colors",

        -- 2. Configuration Options (opts is inside the plugin table)
        opts = {
            -- Render style. 'background' is generally the clearest.
            render = "background",

            -- Virtual symbol settings (used if render = 'virtual')
            virtual_symbol = "■",
            virtual_symbol_prefix = "",
            virtual_symbol_suffix = " ",
            virtual_symbol_position = "inline",

            -- Enable highlighting for various color formats
            enable_hex = true,
            enable_short_hex = true,
            enable_rgb = true,
            enable_hsl = true,
            enable_ansi = true,
            enable_hsl_without_function = true,
            enable_var_usage = true,
            enable_named_colors = true,
            enable_tailwind = false,

            -- Set custom colors (useful for highlighting CSS variables)
            custom_colors = {
                { label = "%-%-theme%-primary%-color", color = "#0f1219" },
                { label = "%-%-theme%-secondary%-color", color = "#5a5d64" },
            },

            -- Exclusions
            exclude_filetypes = {},
            exclude_buftypes = {},
            exclude_buffer = function(bufnr) end,
        },
    },
}
