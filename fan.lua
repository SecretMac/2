-- Blacklist table
local blacklist = {
    "gsuo",
    "Voltk5638",
    "3itx"
}

-- Check if the current user is blacklisted (username or display name)
local player = game.Players.LocalPlayer
local username = player.Name
local displayName = player.DisplayName

for _, blacklistedUser in ipairs(blacklist) do
    if username == blacklistedUser or displayName == blacklistedUser then
        -- Show fake notification
        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Parent = game:GetService("CoreGui")
        ScreenGui.ResetOnSpawn = false
        ScreenGui.IgnoreGuiInset = true

        local NotificationFrame = Instance.new("Frame")
        NotificationFrame.Size = UDim2.new(0, 300, 0, 150)
        NotificationFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
        NotificationFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        NotificationFrame.BackgroundTransparency = 0.2
        NotificationFrame.BorderSizePixel = 0
        NotificationFrame.Parent = ScreenGui

        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 12)
        Corner.Parent = NotificationFrame

        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(1, 0, 0, 40)
        Title.BackgroundTransparency = 1
        Title.Text = "Stalkie"
        Title.TextColor3 = Color3.fromRGB(0, 200, 255)
        Title.TextSize = 28
        Title.Font = Enum.Font.GothamBlack
        Title.Parent = NotificationFrame

        local Message = Instance.new("TextLabel")
        Message.Size = UDim2.new(1, 0, 0, 80)
        Message.Position = UDim2.new(0, 0, 0, 40)
        Message.BackgroundTransparency = 1
        Message.Text = "Sorry, the script is down for updates.\nPlease try again later."
        Message.TextColor3 = Color3.fromRGB(173, 216, 230)
        Message.TextSize = 16
        Message.Font = Enum.Font.Gotham
        Message.TextWrapped = true
        Message.TextTransparency = 0.2
        Message.Parent = NotificationFrame

        local CloseButton = Instance.new("TextButton")
        CloseButton.Size = UDim2.new(0, 30, 0, 30)
        CloseButton.Position = UDim2.new(1, -40, 0, 10)
        CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        CloseButton.BackgroundTransparency = 0.9
        CloseButton.Text = "X"
        CloseButton.TextColor3 = Color3.fromRGB(0, 200, 255)
        CloseButton.TextSize = 20
        CloseButton.Font = Enum.Font.GothamBold
        CloseButton.Parent = NotificationFrame

        local CloseCorner = Instance.new("UICorner")
        CloseCorner.CornerRadius = UDim.new(0, 8)
        CloseCorner.Parent = CloseButton

        -- Fade in animation
        local TweenService = game:GetService("TweenService")
        NotificationFrame.BackgroundTransparency = 1
        Title.TextTransparency = 1
        Message.TextTransparency = 1
        CloseButton.TextTransparency = 1
        CloseButton.BackgroundTransparency = 1

        local fadeIn = TweenService:Create(NotificationFrame, TweenInfo.new(0.5), {BackgroundTransparency = 0.2})
        local titleFadeIn = TweenService:Create(Title, TweenInfo.new(0.5), {TextTransparency = 0})
        local messageFadeIn = TweenService:Create(Message, TweenInfo.new(0.5), {TextTransparency = 0.2})
        local closeFadeIn = TweenService:Create(CloseButton, TweenInfo.new(0.5), {TextTransparency = 0, BackgroundTransparency = 0.9})

        fadeIn:Play()
        titleFadeIn:Play()
        messageFadeIn:Play()
        closeFadeIn:Play()

        -- Close button functionality
        CloseButton.MouseButton1Click:Connect(function()
            local fadeOut = TweenService:Create(NotificationFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1})
            local titleFadeOut = TweenService:Create(Title, TweenInfo.new(0.5), {TextTransparency = 1})
            local messageFadeOut = TweenService:Create(Message, TweenInfo.new(0.5), {TextTransparency = 1})
            local closeFadeOut = TweenService:Create(CloseButton, TweenInfo.new(0.5), {TextTransparency = 1, BackgroundTransparency = 1})

            fadeOut:Play()
            titleFadeOut:Play()
            messageFadeOut:Play()
            closeFadeOut:Play()
            fadeOut.Completed:Connect(function()
                ScreenGui:Destroy()
            end)
        end)

        return false -- Halt script execution
    end
end

return true -- Allow script to continue if not blacklisted
