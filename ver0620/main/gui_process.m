function [] = gui_process(app)
while true
    switch app.STATE
        case demo_gui_state.IDLE
            % Do nothing
        case demo_gui_state.CONN
           t = tcpServer(app.ip, app.port);
end
end