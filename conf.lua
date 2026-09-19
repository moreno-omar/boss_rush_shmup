-- other useful configs

function love.conf(t)

    -- debug
    t.console = true

   	-- set standard width for shmup
	t.window.width = 900
	t.window.height = 1200

    t.window.resizable = false          -- Let the window be user-resizable (boolean)
    t.window.fullscreen = false         -- Enable fullscreen (boolean)

    -- options to use when can be resized
    t.window.minwidth = 1               -- Minimum window width if the window is resizable (number)
    t.window.minheight = 1              -- Minimum window height if the window is resizable (number)

end
