local epinWindow, epinEdit, epinButton

function toggleEPinPanel()
    if not epinWindow then
        local screenW, screenH = guiGetScreenSize()
        local windowW, windowH = 450, 200
        local x, y = (screenW - windowW) / 2, (screenH - windowH) / 2

        epinWindow = guiCreateWindow(x, y, windowW, windowH, "faroid.exe ~ E-Pin Sistemi", false)
        guiWindowSetSizable(epinWindow, false)
        guiSetVisible(epinWindow, true)

        guiCreateLabel(20, 40, 410, 20, "E-Pin Kodu:", false, epinWindow)
        epinEdit = guiCreateEdit(20, 70, 410, 30, "", false, epinWindow)

        epinButton = guiCreateButton(20, 120, 410, 30, "Kullan", false, epinWindow)

        local closeButton = guiCreateButton(windowW - 40, 10, 30, 30, "X", false, epinWindow)
        guiSetFont(closeButton, "default-bold-small")
        guiSetProperty(closeButton, "NormalTextColour", "FFAAAAAA")
        addEventHandler("onClientGUIClick", closeButton, toggleEPinPanel, false)

        addEventHandler("onClientGUIClick", epinButton, function()
            local epinCode = guiGetText(epinEdit)
            if epinCode and epinCode ~= "" then
                triggerServerEvent("epinPanel:redeem", localPlayer, epinCode)
            else
                outputChatBox("Lütfen bir E-Pin kodu girin!", 255, 0, 0)
            end
        end, false)

        showCursor(true)
    else
        destroyElement(epinWindow)
        epinWindow, epinEdit, epinButton = nil, nil, nil
        showCursor(false)
    end
end
addCommandHandler("epin", toggleEPinPanel)

-- Discord: miun2750
