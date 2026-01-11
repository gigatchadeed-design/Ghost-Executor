-- GHOST PRO V8 [ENGINE REWRITE - SOLARA STYLE]
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local Players = game:GetService("Players")
local LogService = game:GetService("LogService")

-- Suppression de l'ancienne version
local old = Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("GhostV8")
if old then old:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GhostV8"
ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local ICONS = {
	terminal = "rbxassetid://7743872929",
	trash = "rbxassetid://7743873871",
	plus = "rbxassetid://8997386355",
	close = "rbxassetid://7743878857",
	min = "rbxassetid://7733997941",
	console = "rbxassetid://7734053495"
}

local function CreateTween(obj, info, goal)
	local tween = TS:Create(obj, TweenInfo.new(info, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), goal)
	tween:Play()
	return tween
end

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -190)
MainFrame.Size = UDim2.new(0, 600, 0, 380)
MainFrame.BorderSizePixel = 0

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 6)
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(35, 35, 35)
MainStroke.Thickness = 1.5

-- Open Button
local OpenBtn = Instance.new("TextButton")
OpenBtn.Name = "OpenBtn"
OpenBtn.Parent = ScreenGui
OpenBtn.Size = UDim2.new(0, 80, 0, 30)
OpenBtn.Position = UDim2.new(0, 20, 0, 20)
OpenBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
OpenBtn.Text = "GHOST"
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.TextColor3 = Color3.fromRGB(0, 150, 255)
OpenBtn.TextSize = 12
OpenBtn.Visible = false
Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(0, 4)
local OpenStroke = Instance.new("UIStroke", OpenBtn)
OpenStroke.Color = Color3.fromRGB(0, 150, 255)
OpenStroke.Thickness = 1.2

-- TopBar
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BackgroundTransparency = 1
TopBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Text = "  GHOST PRO V8"
Title.Font = Enum.Font.GothamMedium
Title.TextColor3 = Color3.fromRGB(200, 200, 200)
Title.TextSize = 12
Title.Size = UDim2.new(0, 200, 1, 0)
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local Close = Instance.new("ImageButton")
Close.Size = UDim2.new(0, 16, 0, 16)
Close.Position = UDim2.new(1, -28, 0, 10)
Close.Image = ICONS.close
Close.ImageColor3 = Color3.fromRGB(200, 200, 200)
Close.BackgroundTransparency = 1
Close.Parent = TopBar

local Min = Instance.new("ImageButton")
Min.Size = UDim2.new(0, 16, 0, 16)
Min.Position = UDim2.new(1, -55, 0, 10)
Min.Image = ICONS.min
Min.ImageColor3 = Color3.fromRGB(200, 200, 200)
Min.BackgroundTransparency = 1
Min.Parent = TopBar

Min.MouseButton1Click:Connect(function()
	MainFrame.Visible = false
	OpenBtn.Visible = true
end)

OpenBtn.MouseButton1Click:Connect(function()
	OpenBtn.Visible = false
	MainFrame.Visible = true
end)

-- Tabs System
local TabData = {["Main"] = "-- Ghost V8\nprint('Solara Style Ready')"}
local CurrentTab = "Main"

local TabScroll = Instance.new("ScrollingFrame")
TabScroll.Size = UDim2.new(1, -60, 0, 32)
TabScroll.Position = UDim2.new(0, 10, 0, 35)
TabScroll.BackgroundTransparency = 1
TabScroll.ScrollBarThickness = 0
TabScroll.AutomaticCanvasSize = Enum.AutomaticSize.X
TabScroll.Parent = MainFrame

local TabList = Instance.new("UIListLayout")
TabList.FillDirection = Enum.FillDirection.Horizontal
TabList.Padding = UDim.new(0, 5)
TabList.Parent = TabScroll

local AddTab = Instance.new("ImageButton")
AddTab.Size = UDim2.new(0, 16, 0, 16)
AddTab.Position = UDim2.new(1, -30, 0, 43)
AddTab.Image = ICONS.plus
AddTab.ImageColor3 = Color3.fromRGB(150, 150, 150)
AddTab.BackgroundTransparency = 1
AddTab.Parent = MainFrame

-- EDITOR
local EditorBG = Instance.new("Frame")
EditorBG.Position = UDim2.new(0, 10, 0, 75)
EditorBG.Size = UDim2.new(1, -20, 0, 250)
EditorBG.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
EditorBG.ClipsDescendants = true
EditorBG.Parent = MainFrame
Instance.new("UICorner", EditorBG).CornerRadius = UDim.new(0, 4)
Instance.new("UIStroke", EditorBG).Color = Color3.fromRGB(30, 30, 30)

local EditorFrame = Instance.new("ScrollingFrame")
EditorFrame.Position = UDim2.new(0, 0, 0, 5)
EditorFrame.Size = UDim2.new(1, 0, 1, -10)
EditorFrame.BackgroundTransparency = 1
EditorFrame.ScrollBarThickness = 2
EditorFrame.AutomaticCanvasSize = Enum.AutomaticSize.XY
EditorFrame.Parent = EditorBG

local LineNumbers = Instance.new("TextLabel")
LineNumbers.Size = UDim2.new(0, 35, 1, 0)
LineNumbers.BackgroundTransparency = 1
LineNumbers.TextColor3 = Color3.fromRGB(80, 80, 80)
LineNumbers.TextSize = 12
LineNumbers.Font = Enum.Font.Code
LineNumbers.Text = "1"
LineNumbers.LineHeight = 1.2
LineNumbers.TextYAlignment = Enum.TextYAlignment.Top
LineNumbers.TextXAlignment = Enum.TextXAlignment.Center
LineNumbers.Parent = EditorFrame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, -40, 1, 0)
TextBox.Position = UDim2.new(0, 40, 0, 0)
TextBox.MultiLine = true
TextBox.Font = Enum.Font.Code
TextBox.TextSize = 12
TextBox.LineHeight = 1.2
TextBox.TextColor3 = Color3.fromRGB(220, 220, 220)
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.ClearTextOnFocus = false
TextBox.BackgroundTransparency = 1
TextBox.Parent = EditorFrame

local function updateLines()
	local lines = #TextBox.Text:split("\n")
	if TextBox.Text:sub(-1) == "\n" then lines = lines + 1 end
	local lineStr = ""
	for i = 1, lines do lineStr = lineStr .. i .. "\n" end
	LineNumbers.Text = lineStr
	local height = math.max(TextBox.TextBounds.Y, 240)
	LineNumbers.Size = UDim2.new(0, 35, 0, height)
	TextBox.Size = UDim2.new(1, -40, 0, height)
end
TextBox:GetPropertyChangedSignal("Text"):Connect(updateLines)

-- CONSOLE SYSTEM
local ConsoleFrame = Instance.new("Frame")
ConsoleFrame.Size = EditorBG.Size
ConsoleFrame.Position = EditorBG.Position
ConsoleFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
ConsoleFrame.Visible = false
ConsoleFrame.Parent = MainFrame
Instance.new("UICorner", ConsoleFrame).CornerRadius = UDim.new(0, 4)
Instance.new("UIStroke", ConsoleFrame).Color = Color3.fromRGB(40, 40, 40)

local ConsoleScroll = Instance.new("ScrollingFrame")
ConsoleScroll.Size = UDim2.new(1, -10, 1, -10)
ConsoleScroll.Position = UDim2.new(0, 5, 0, 5)
ConsoleScroll.BackgroundTransparency = 1
ConsoleScroll.ScrollBarThickness = 2
ConsoleScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
ConsoleScroll.Parent = ConsoleFrame

local ConsoleList = Instance.new("UIListLayout")
ConsoleList.Padding = UDim.new(0, 2)
ConsoleList.Parent = ConsoleScroll

local function AddLog(msg, type)
	local log = Instance.new("TextLabel")
	log.Size = UDim2.new(1, 0, 0, 18)
	log.BackgroundTransparency = 1
	log.Font = Enum.Font.Code
	log.TextSize = 11
	log.Text = " [" .. os.date("%X") .. "] " .. msg
	log.TextXAlignment = Enum.TextXAlignment.Left
	
	if type == Enum.MessageType.MessageOutput then
		log.TextColor3 = Color3.fromRGB(0, 170, 255) -- Bleu (Success/Info)
	elseif type == Enum.MessageType.MessageWarning then
		log.TextColor3 = Color3.fromRGB(255, 200, 0) -- Jaune (Warning)
	elseif type == Enum.MessageType.MessageError then
		log.TextColor3 = Color3.fromRGB(255, 80, 80) -- Rouge (Error)
	end
	log.Parent = ConsoleScroll
end

LogService.MessageOut:Connect(AddLog)

-- Tab Function (FIXED CLOSE)
local function createTabUI(name)
	local b = Instance.new("TextButton")
	b.Name = name
	b.Size = UDim2.new(0, 115, 0, 28)
	b.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
	b.Text = "    " .. name
	b.Font = Enum.Font.Gotham
	b.TextColor3 = Color3.fromRGB(130, 130, 130)
	b.TextSize = 11
	b.TextXAlignment = Enum.TextXAlignment.Left
	b.Parent = TabScroll
	
	Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
	local bStroke = Instance.new("UIStroke", b)
	bStroke.Color = Color3.fromRGB(35, 35, 35)
	
	local DelBtn = Instance.new("ImageButton")
	DelBtn.Size = UDim2.new(0, 14, 0, 14)
	DelBtn.Position = UDim2.new(1, -20, 0.5, -7)
	DelBtn.BackgroundTransparency = 1
	DelBtn.Image = ICONS.close
	DelBtn.ImageColor3 = Color3.fromRGB(150, 150, 150)
	DelBtn.ZIndex = 5
	DelBtn.Parent = b

	local function select()
		TabData[CurrentTab] = TextBox.Text
		CurrentTab = name
		TextBox.Text = TabData[name] or ""
		for _, v in pairs(TabScroll:GetChildren()) do
			if v:IsA("TextButton") then
				v.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
				v.TextColor3 = Color3.fromRGB(130, 130, 130)
			end
		end
		b.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
		b.TextColor3 = Color3.new(1,1,1)
		updateLines()
	end

	b.MouseButton1Click:Connect(select)
	
	DelBtn.MouseButton1Click:Connect(function()
		if #TabScroll:GetChildren() <= 2 then return end -- Garder au moins 1 onglet
		TabData[name] = nil
		b:Destroy()
		if CurrentTab == name then
			local first = TabScroll:FindFirstChildOfClass("TextButton")
			if first then 
				CurrentTab = first.Name
				TextBox.Text = TabData[CurrentTab]
				updateLines()
			end
		end
	end)
	
	if CurrentTab == name then select() end
end

createTabUI("Main")

AddTab.MouseButton1Click:Connect(function()
	local n = "Tab " .. tostring(#TabScroll:GetChildren())
	TabData[n] = ""
	createTabUI(n)
end)

-- Action Buttons
local function createActionBtn(name, icon, pos)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(0, 110, 0, 30)
	b.Position = pos
	b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	b.Text = "      " .. name
	b.Font = Enum.Font.GothamMedium
	b.TextColor3 = Color3.fromRGB(220, 220, 220)
	b.TextSize = 11
	b.Parent = MainFrame
	Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
	Instance.new("UIStroke", b).Color = Color3.fromRGB(40, 40, 40)
	local img = Instance.new("ImageLabel")
	img.Size = UDim2.new(0, 14, 0, 14)
	img.Position = UDim2.new(0, 10, 0.5, -7)
	img.Image = icon
	img.ImageColor3 = Color3.fromRGB(200, 200, 200)
	img.BackgroundTransparency = 1
	img.Parent = b
	return b
end

local Exec = createActionBtn("EXECUTE", ICONS.terminal, UDim2.new(0, 10, 1, -45))
local Clear = createActionBtn("CLEAR", ICONS.trash, UDim2.new(0, 130, 1, -45))
local ConsoleBtn = createActionBtn("CONSOLE", ICONS.console, UDim2.new(0, 250, 1, -45))

ConsoleBtn.MouseButton1Click:Connect(function()
	ConsoleFrame.Visible = not ConsoleFrame.Visible
	EditorBG.Visible = not ConsoleFrame.Visible
	ConsoleBtn.Text = ConsoleFrame.Visible and "      EDITOR" or "      CONSOLE"
end)

Exec.MouseButton1Click:Connect(function() 
	local f, err = loadstring(TextBox.Text) 
	if f then 
		task.spawn(f) 
	else 
		warn("Ghost Error: " .. err) 
	end 
end)

Clear.MouseButton1Click:Connect(function() 
	if ConsoleFrame.Visible then
		for _, v in pairs(ConsoleScroll:GetChildren()) do
			if v:IsA("TextLabel") then v:Destroy() end
		end
	else
		TextBox.Text = "" 
		updateLines() 
	end
end)

-- Dragging
local function drag(f)
	local dragging, dragStart, startPos
	f.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true dragStart = input.Position startPos = f.Position
		end
	end)
	UIS.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - dragStart
			f.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
	UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
end
drag(MainFrame)
drag(OpenBtn)

-- Close Warning
local Warn = Instance.new("Frame")
Warn.Size = UDim2.new(0, 260, 0, 0)
Warn.Position = UDim2.new(0.5, -130, 0.5, -60)
Warn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Warn.Visible = false
Warn.ClipsDescendants = true
Warn.Parent = ScreenGui
Instance.new("UICorner", Warn)
Instance.new("UIStroke", Warn).Color = Color3.fromRGB(50, 50, 50)

local WText = Instance.new("TextLabel")
WText.Size = UDim2.new(1, 0, 0, 60)
WText.Text = "Close Ghost Pro V8?"
WText.Font = Enum.Font.Gotham
WText.TextColor3 = Color3.fromRGB(200, 200, 200)
WText.BackgroundTransparency = 1
WText.Parent = Warn

local Yes = Instance.new("TextButton")
Yes.Size = UDim2.new(0, 100, 0, 30)
Yes.Position = UDim2.new(0, 20, 0, 70)
Yes.Text = "Exit"
Yes.BackgroundColor3 = Color3.fromRGB(150, 30, 30)
Yes.TextColor3 = Color3.new(1,1,1)
Yes.Parent = Warn
Instance.new("UICorner", Yes)

local No = Yes:Clone()
No.Position = UDim2.new(1, -120, 0, 70)
No.Text = "Cancel"
No.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
No.Parent = Warn

No.MouseButton1Click:Connect(function() CreateTween(Warn, 0.2, {Size = UDim2.new(0, 260, 0, 0)}) task.wait(0.2) Warn.Visible = false end)
Yes.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
Close.MouseButton1Click:Connect(function() Warn.Visible = true CreateTween(Warn, 0.3, {Size = UDim2.new(0, 260, 0, 120)}) end)
