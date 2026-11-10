--discord.gg/boronide, code generated using luamin.js™




local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local Theme = {
	Background = Color3.fromRGB(20, 21, 24),
	Console = Color3.fromRGB(27, 29, 33),
	Surface = Color3.fromRGB(27, 29, 33),
	SurfaceLight = Color3.fromRGB(44, 47, 53),
	Stroke = Color3.fromRGB(255, 255, 255),
	Accent = Color3.fromRGB(98, 201, 215),
	PanelTransparency = 0.45,
	WindowPadding = 8,
	PanelGap = 6,
	Text = Color3.fromRGB(235, 237, 240),
	Dim = Color3.fromRGB(140, 145, 152),
	Divider = Color3.fromRGB(255, 255, 255),
}

local Storage = {
	Icons = {
		Console = "rbxassetid://14358439491",
	},
}

local function Create(Object_Type, Object_Properties)
	local Object = Instance.new(Object_Type)
	for Property, Value in next, Object_Properties do
		Object[Property] = Value
	end
	return Object
end

local function CreateTween(Object, Tween_Duration, Tween_Easing_Style, Tween_Properties)
	local Tween = TweenService:Create(Object, TweenInfo.new(Tween_Duration, Tween_Easing_Style), Tween_Properties)
	Tween:Play()
	return Tween
end

local function Shadow(ShadowProperties)
	local ShadowFrame =
		Create(
		"Frame",
		{
		Parent = ShadowProperties.Parent,
		Name = "ShadowFrame",
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Theme.Stroke,
		BackgroundTransparency = 1,
		BorderColor3 = Theme.Stroke,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Visible = true,
		ClipsDescendants = false
	}
	)

	local ShadowFrame_UICorner =
		Create(
		"UICorner",
		{
		Parent = ShadowFrame,
		CornerRadius = UDim.new(0, ShadowProperties.CornerRadius)
	}
	)

	local ShadowFrame_UIStroke =
		Create(
		"UIStroke",
		{
		Parent = ShadowFrame,
		Color = Theme.Background,
		Thickness = ShadowProperties.Thickness,
		Transparency = ShadowProperties.Transparency
	}
	)
end

local function Gradient(GradientProperties)
	local GradientFrame =
		Create(
		"Frame",
		{
		Parent = GradientProperties.Parent,
		Name = "GradientFrame",
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Theme.Stroke,
		BackgroundTransparency = 0,
		BorderColor3 = Theme.Stroke,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Visible = true,
		ClipsDescendants = false
	}
	)

	local GradientFrame_UICorner =
		Create(
		"UICorner",
		{
		Parent = GradientFrame,
		CornerRadius = UDim.new(0, GradientProperties.CornerRadius)
	}
	)

	local GradientFrame_UIGradient =
		Create(
		"UIGradient",
		{
		Parent = GradientFrame,
		Color = GradientProperties.Color,
		Rotation = GradientProperties.Rotation,
		Transparency = GradientProperties.Transparency
	}
	)
end

local function dragGUI(gui, target)
	target = target or gui
	task.spawn(function()
		local dragging
		local dragInput
		local dragStart
		local startPos
		local function update(input)
			local delta = input.Position - dragStart
			local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			TweenService:Create(target, TweenInfo.new(0.20), {
				Position = Position
			}):Play()
		end
		gui.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = target.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)
		gui.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement then
				dragInput = input
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				update(input)
			end
		end)

		UserInputService.TouchMoved:Connect(function(touch, gameProcessed)
			if dragging and not gameProcessed then
				update({
					Position = touch.Position
				})
			end
		end)
	end)
end

local Library = {}

function Library:CreateWindow(WindowProperties)

	local Window_Name = WindowProperties.Name or "FarmHub"
	local Window_Size = WindowProperties.Size or Vector2.new(602, 378)
	local Window_Keybind = WindowProperties.Keybind

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = Window_Name
	ScreenGui.ResetOnSpawn = false
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.DisplayOrder = 100
	local uiparent = Players.LocalPlayer.PlayerGui
	local Existing = uiparent:FindFirstChild(Window_Name)
	if Existing then
		Existing:Destroy()
	end
	ScreenGui.Parent = uiparent

	local WindowFrame =
		Create(
		"Frame",
		{
		Parent = ScreenGui,
		Name = "Window",
		AnchorPoint = Vector2.new(0.5, 0.5),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Theme.Background,
		BackgroundTransparency = 0,
		BorderColor3 = Theme.Stroke,
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Rotation = 0,
		Size = UDim2.new(0, Window_Size.X, 0, Window_Size.Y),
		Visible = true,
		ClipsDescendants = false
	}
	)

	local Window_UICorner =
		Create(
		"UICorner",
		{
		Parent = WindowFrame,
		CornerRadius = UDim.new(0, 12)
	}
	)

	local Window_UIStroke =
		Create(
		"UIStroke",
		{
		Parent = WindowFrame,
		Color = Theme.Stroke,
		Thickness = 1,
		Transparency = 0.85
	}
	)

	local WindowShadowFolder =
		Create(
		"Folder",
		{
		Parent = WindowFrame,
		Name = "Shadow"
	}
	)

	Shadow(
		{
		Parent = WindowShadowFolder,
		Thickness = 1,
		Transparency = 0.95,
		CornerRadius = 12
	}
	)

	Shadow(
		{
		Parent = WindowShadowFolder,
		Thickness = 3,
		Transparency = 0.95,
		CornerRadius = 12
	}
	)

	Shadow(
		{
		Parent = WindowShadowFolder,
		Thickness = 5,
		Transparency = 0.95,
		CornerRadius = 12
	}
	)

	Shadow(
		{
		Parent = WindowShadowFolder,
		Thickness = 7,
		Transparency = 0.95,
		CornerRadius = 12
	}
	)

	local WindowGradientFolder =
		Create(
		"Folder",
		{
		Parent = WindowFrame,
		Name = "Gradient"
	}
	)

	Gradient(
		{
		Parent = WindowGradientFolder,
		Color = ColorSequence.new {
			ColorSequenceKeypoint.new(0.00, Theme.Accent),
			ColorSequenceKeypoint.new(1.00, Color3.fromRGB(25, 24, 24))
		},
		Rotation = -60,
		Transparency = NumberSequence.new {
			NumberSequenceKeypoint.new(0.00, 0.27),
			NumberSequenceKeypoint.new(0.44, 1.00),
			NumberSequenceKeypoint.new(1.00, 0.98)
		},
		CornerRadius = 12
	}
	)

	Gradient(
		{
		Parent = WindowGradientFolder,
		Color = ColorSequence.new {
			ColorSequenceKeypoint.new(0.00, Theme.Accent),
			ColorSequenceKeypoint.new(1.00, Color3.fromRGB(25, 24, 24))
		},
		Rotation = -120,
		Transparency = NumberSequence.new {
			NumberSequenceKeypoint.new(0.00, 0.27),
			NumberSequenceKeypoint.new(0.44, 1.00),
			NumberSequenceKeypoint.new(1.00, 0.98)
		},
		CornerRadius = 12
	}
	)

	local Window = {
		Frame = WindowFrame,
		Console = nil,
		Tabs = nil
	}

	local ConsolePanel =
		Create(
		"Frame",
		{
		Parent = WindowFrame,
		Name = "ConsolePanel",
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Theme.Console,
		BackgroundTransparency = Theme.PanelTransparency,
		BorderColor3 = Theme.Stroke,
		BorderSizePixel = 0,
		Position = UDim2.new(0, Theme.WindowPadding, 0, Theme.WindowPadding),
		Rotation = 0,
		Size = UDim2.new(0.65, -(Theme.PanelGap / 2) - Theme.WindowPadding, 1, -2 * Theme.WindowPadding),
		Visible = true,
		ClipsDescendants = true
	}
	)

	local ConsolePanel_UICorner =
		Create(
		"UICorner",
		{
		Parent = ConsolePanel,
		CornerRadius = UDim.new(0, 10)
	}
	)

	local ConsoleHeader =
		Create(
		"Frame",
		{
		Parent = ConsolePanel,
		Name = "Header",
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Theme.Console,
		BackgroundTransparency = 1,
		BorderColor3 = Theme.Stroke,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		Size = UDim2.new(1, 0, 0, 48),
		Visible = true,
		ClipsDescendants = false
	}
	)

	local ConsoleTitle =
		Create(
		"TextLabel",
		{
		Parent = ConsoleHeader,
		Name = "Title",
		AnchorPoint = Vector2.new(0, 0),
		BackgroundColor3 = Theme.Text,
		BackgroundTransparency = 1,
		BorderColor3 = Theme.Stroke,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 14, 0, 0),
		Rotation = 0,
		Size = UDim2.new(0, 0, 1, 0),
		AutomaticSize = Enum.AutomaticSize.X,
		Visible = true,
		ClipsDescendants = false,
		FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold),
		Text = "Auto Robbery",
		TextColor3 = Theme.Text,
		TextSize = 18,
		TextStrokeColor3 = Theme.Console,
		TextStrokeTransparency = 1,
		TextTransparency = 0,
		TextTruncate = Enum.TextTruncate.AtEnd,
		TextWrapped = false,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center
	}
	)

	local ConsoleHash =
		Create(
		"TextLabel",
		{
		Parent = ConsoleHeader,
		Name = "Hash",
		AnchorPoint = Vector2.new(1, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Theme.Text,
		BackgroundTransparency = 1,
		BorderColor3 = Theme.Stroke,
		BorderSizePixel = 0,
		Position = UDim2.new(1, -14, 0, 0),
		Rotation = 0,
		Size = UDim2.new(0.55, 0, 1, 0),
		Visible = true,
		ClipsDescendants = false,
		FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold),
		Text = "VnsgEQ88Fz5CF2l3GVI+VVRtChUYVXtS",
		TextColor3 = Theme.Dim,
		TextSize = 10,
		TextStrokeColor3 = Theme.Console,
		TextStrokeTransparency = 1,
		TextTransparency = 0.72,
		TextTruncate = Enum.TextTruncate.AtEnd,
		TextWrapped = false,
		TextXAlignment = Enum.TextXAlignment.Right,
		TextYAlignment = Enum.TextYAlignment.Center
	}
	)

	local ConsoleHeaderDivider =
		Create(
		"Frame",
		{
		Parent = ConsoleHeader,
		Name = "Divider",
		AnchorPoint = Vector2.new(0, 1),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Theme.Divider,
		BackgroundTransparency = 0.93,
		BorderColor3 = Theme.Stroke,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 1, 0),
		Rotation = 0,
		Size = UDim2.new(1, 0, 0, 1),
		Visible = true,
		ClipsDescendants = false
	}
	)

	local ConsoleContainer =
		Create(
		"ScrollingFrame",
		{
		Parent = ConsolePanel,
		Name = "Container",
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Theme.Text,
		BackgroundTransparency = 1,
		BorderColor3 = Theme.Stroke,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 12, 0, 56),
		Rotation = 0,
		Size = UDim2.new(1, -20, 1, -64),
		Visible = true,
		ClipsDescendants = true,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		CanvasPosition = Vector2.new(0, 0),
		CanvasSize = UDim2.new(0, 0, 0, 0),
		ScrollBarImageColor3 = Theme.SurfaceLight,
		ScrollBarThickness = 2,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ScrollingEnabled = true
	}
	)

	local ConsoleContainer_UIListLayout =
		Create(
		"UIListLayout",
		{
		Parent = ConsoleContainer,
		Padding = UDim.new(0, 4),
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		SortOrder = Enum.SortOrder.LayoutOrder
	}
	)

	local Console = {}

	local function ScrollConsoleToBottom()
		local MaximumCanvasPosition = math.max(
			0,
			ConsoleContainer_UIListLayout.AbsoluteContentSize.Y - ConsoleContainer.AbsoluteWindowSize.Y
		)
		ConsoleContainer.CanvasPosition = Vector2.new(0, MaximumCanvasPosition)
	end

	ConsoleContainer_UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(ScrollConsoleToBottom)

	function Console:Log(ConsoleLogProperties)
		local Text = ConsoleLogProperties.Text or ""
		local Color = ConsoleLogProperties.Color or Theme.Text

		if #ConsoleContainer:GetChildren() >= 200 then
			for _, Child in ConsoleContainer:GetChildren() do
				if Child:IsA("TextLabel") then
					Child:Destroy()
				end
			end
		end

		local LogLabel =
			Create(
			"TextLabel",
			{
			Parent = ConsoleContainer,
			Name = "Log",
			AnchorPoint = Vector2.new(0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = Theme.Text,
			BackgroundTransparency = 1,
			BorderColor3 = Theme.Stroke,
			BorderSizePixel = 0,
			LayoutOrder = #ConsoleContainer:GetChildren(),
			Position = UDim2.new(0, 0, 0, 0),
			Rotation = 0,
			Size = UDim2.new(1, 0, 0, 0),
			Visible = true,
			ClipsDescendants = false,
			FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Medium),
			RichText = true,
			Text = Text,
			TextColor3 = Color,
			TextSize = 12,
			TextStrokeColor3 = Theme.Console,
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextTruncate = Enum.TextTruncate.None,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}
		)

		task.defer(ScrollConsoleToBottom)
		return LogLabel
	end

	local PagesPanel =
		Create(
		"Frame",
		{
		Parent = WindowFrame,
		Name = "PagesPanel",
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Theme.Surface,
		BackgroundTransparency = Theme.PanelTransparency,
		BorderColor3 = Theme.Stroke,
		BorderSizePixel = 0,
		Position = UDim2.new(0.65, Theme.PanelGap / 2, 0, Theme.WindowPadding),
		Rotation = 0,
		Size = UDim2.new(0.35, -(Theme.PanelGap / 2) - Theme.WindowPadding, 1, -2 * Theme.WindowPadding),
		Visible = true,
		ClipsDescendants = true
	}
	)

	local PagesPanel_UICorner =
		Create(
		"UICorner",
		{
		Parent = PagesPanel,
		CornerRadius = UDim.new(0, 10)
	}
	)

	local TabBar =
		Create(
		"Frame",
		{
		Parent = PagesPanel,
		Name = "TabBar",
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Theme.Surface,
		BackgroundTransparency = 1,
		BorderColor3 = Theme.Stroke,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0, 0),
		Rotation = 0,
		Size = UDim2.new(1, 0, 0, 48),
		Visible = true,
		ClipsDescendants = false
	}
	)

	local TabBarRow =
		Create(
		"Frame",
		{
		Parent = TabBar,
		Name = "ButtonRow",
		AnchorPoint = Vector2.new(0, 0.5),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Theme.Surface,
		BackgroundTransparency = 1,
		BorderColor3 = Theme.Stroke,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0.5, 0),
		Rotation = 0,
		Size = UDim2.new(1, 0, 0, 34),
		Visible = true,
		ClipsDescendants = false
	}
	)

	local TabBar_UIListLayout =
		Create(
		"UIListLayout",
		{
		Parent = TabBarRow,
		Padding = UDim.new(0, 6),
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder
	}
	)

	local TabBar_UIPadding =
		Create(
		"UIPadding",
		{
		Parent = TabBarRow,
		PaddingLeft = UDim.new(0, 10)
	}
	)

	local TabBarDivider =
		Create(
		"Frame",
		{
		Parent = TabBar,
		Name = "Divider",
		AnchorPoint = Vector2.new(0, 1),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Theme.Divider,
		BackgroundTransparency = 0.93,
		BorderColor3 = Theme.Stroke,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 1, 0),
		Rotation = 0,
		Size = UDim2.new(1, 0, 0, 1),
		Visible = true,
		ClipsDescendants = false
	}
	)

	local PagesFolder =
		Create(
		"Frame",
		{
		Parent = PagesPanel,
		Name = "TabsFolder",
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = Theme.Surface,
		BackgroundTransparency = 1,
		BorderColor3 = Theme.Stroke,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0, 49),
		Rotation = 0,
		Size = UDim2.new(1, 0, 1, -49),
		Visible = true,
		ClipsDescendants = true
	}
	)

	local Tabs = {}
	local ActiveTab = nil

	local function SetActiveTab(ActiveTabProperties)
		ActiveTab = ActiveTabProperties
		for _, Tab in next, Tabs do
			local IsActive = (Tab == ActiveTabProperties)

			Tab.Page.Visible = IsActive

			CreateTween(
				Tab.Button,
				0.3,
				Enum.EasingStyle.Exponential,
				{
				BackgroundTransparency = IsActive and 0.85 or 1,
				BackgroundColor3 = Theme.Accent
			}
			)

			CreateTween(
				Tab.Icon,
				0.3,
				Enum.EasingStyle.Exponential,
				{
				ImageColor3 = IsActive and Theme.Accent or Theme.Dim,
				ImageTransparency = IsActive and 0 or 0.35
			}
			)
		end
	end

	function Window:AddTab(TabProperties)
		local Tab_Name = TabProperties.Name or ("Tab" .. tostring(#Tabs + 1))
		local Tab_Icon = TabProperties.Icon or Storage.Icons.Console

		local TabButton =
			Create(
			"TextButton",
			{
			Parent = TabBarRow,
			Name = Tab_Name,
			AnchorPoint = Vector2.new(0, 0.5),
			AutomaticSize = Enum.AutomaticSize.None,
			AutoButtonColor = false,
			BackgroundColor3 = Theme.Accent,
			BackgroundTransparency = 1,
			BorderColor3 = Theme.Stroke,
			BorderSizePixel = 0,
			LayoutOrder = #Tabs + 1,
			Position = UDim2.new(0, 0, 0.5, 0),
			Rotation = 0,
			Size = UDim2.new(0, 32, 0, 32),
			Text = "",
			Visible = true,
			ClipsDescendants = false
		}
		)

		local TabButton_UICorner =
			Create(
			"UICorner",
			{
			Parent = TabButton,
			CornerRadius = UDim.new(0, 8)
		}
		)

		local TabIcon =
			Create(
			"ImageLabel",
			{
			Parent = TabButton,
			Name = "Icon",
			AnchorPoint = Vector2.new(0.5, 0.5),
			AutomaticSize = Enum.AutomaticSize.None,
			BackgroundColor3 = Theme.Text,
			BackgroundTransparency = 1,
			BorderColor3 = Theme.Stroke,
			BorderSizePixel = 0,
			Image = Tab_Icon,
			ImageColor3 = Theme.Dim,
			ImageTransparency = 0.35,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Rotation = 0,
			Size = UDim2.new(0, 20, 0, 20),
			Visible = true,
			ClipsDescendants = false
		}
		)

		local TabPage =
			Create(
			"ScrollingFrame",
			{
			Parent = PagesFolder,
			Name = Tab_Name,
			AnchorPoint = Vector2.new(0, 0),
			AutomaticSize = Enum.AutomaticSize.None,
			BackgroundColor3 = Theme.Surface,
			BackgroundTransparency = 1,
			BorderColor3 = Theme.Stroke,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0, 0),
			Rotation = 0,
			Size = UDim2.new(1, 0, 1, 0),
			Visible = false,
			ClipsDescendants = true,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasPosition = Vector2.new(0, 0),
			CanvasSize = UDim2.new(0, 0, 0, 0),
			ScrollBarImageColor3 = Theme.SurfaceLight,
			ScrollBarThickness = 2,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollingEnabled = true
		}
		)

		local TabPage_UIListLayout =
			Create(
			"UIListLayout",
			{
			Parent = TabPage,
			Padding = UDim.new(0, 8),
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		}
		)

		local TabPage_UIPadding =
			Create(
			"UIPadding",
			{
			Parent = TabPage,
			PaddingTop = UDim.new(0, 10),
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingBottom = UDim.new(0, 10)
		}
		)

		local Tab = {
			Name = Tab_Name,
			Button = TabButton,
			Icon = TabIcon,
			Page = TabPage
		}

		table.insert(Tabs, Tab)

		function Tab:CreateToggle(ToggleProperties)
			local Toggle_Name = ToggleProperties.Name or "Toggle"
			local Toggle_Default = ToggleProperties.Default or false
			local Toggle_Callback = ToggleProperties.Callback
			local Toggle_State = Toggle_Default and true or false

			local ToggleRow =
				Create(
				"TextButton",
				{
				Parent = TabPage,
				Name = Toggle_Name,
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.None,
				AutoButtonColor = false,
				BackgroundColor3 = Theme.SurfaceLight,
				BackgroundTransparency = 1,
				BorderColor3 = Theme.Stroke,
				BorderSizePixel = 0,
				LayoutOrder = #TabPage:GetChildren(),
				Position = UDim2.new(0, 0, 0, 0),
				Rotation = 0,
				Size = UDim2.new(1, 0, 0, 22),
				Text = "",
				Visible = true,
				ClipsDescendants = false
			}
			)

			local ToggleTrack =
				Create(
				"Frame",
				{
				Parent = ToggleRow,
				Name = "Track",
				AnchorPoint = Vector2.new(1, 0.5),
				AutomaticSize = Enum.AutomaticSize.None,
				BackgroundColor3 = Theme.SurfaceLight,
				BackgroundTransparency = 0,
				BorderColor3 = Theme.Stroke,
				BorderSizePixel = 0,
				Position = UDim2.new(1, -10, 0.5, 0),
				Rotation = 0,
				Size = UDim2.new(0, 34, 0, 18),
				Visible = true,
				ClipsDescendants = false
			}
			)

			local ToggleTrack_UICorner =
				Create(
				"UICorner",
				{
				Parent = ToggleTrack,
				CornerRadius = UDim.new(1, 0)
			}
			)

			local ToggleKnob =
				Create(
				"Frame",
				{
				Parent = ToggleTrack,
				Name = "Knob",
				AnchorPoint = Vector2.new(0, 0.5),
				AutomaticSize = Enum.AutomaticSize.None,
				BackgroundColor3 = Theme.Text,
				BackgroundTransparency = 0,
				BorderColor3 = Theme.Stroke,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 2, 0.5, 0),
				Rotation = 0,
				Size = UDim2.new(0, 14, 0, 14),
				Visible = true,
				ClipsDescendants = false
			}
			)

			local ToggleKnob_UICorner =
				Create(
				"UICorner",
				{
				Parent = ToggleKnob,
				CornerRadius = UDim.new(1, 0)
			}
			)

			local ToggleLabel =
				Create(
				"TextLabel",
				{
				Parent = ToggleRow,
				Name = "Label",
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.None,
				BackgroundColor3 = Theme.Text,
				BackgroundTransparency = 1,
				BorderColor3 = Theme.Stroke,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 10, 0, 0),
				Rotation = 0,
				Size = UDim2.new(1, -54, 1, 0),
				Visible = true,
				ClipsDescendants = false,
				FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold),
				Text = Toggle_Name,
				TextColor3 = Theme.Text,
				TextSize = 13,
				TextStrokeColor3 = Theme.Background,
				TextStrokeTransparency = 1,
				TextTransparency = 0,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextWrapped = false,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			}
			)

			local function Render()
				CreateTween(
					ToggleKnob,
					0.25,
					Enum.EasingStyle.Exponential,
					{
					Position = Toggle_State and UDim2.new(1, -16, 0.5, 0) or UDim2.new(0, 2, 0.5, 0)
				}
				)
				CreateTween(
					ToggleTrack,
					0.25,
					Enum.EasingStyle.Exponential,
					{
					BackgroundColor3 = Toggle_State and Theme.Accent or Theme.SurfaceLight
				}
				)
			end

			local Toggle = {}

			function Toggle:Get()
				return Toggle_State
			end

			function Toggle:Set(Value)
				Toggle_State = Value and true or false
				Render()
				if Toggle_Callback then
					task.spawn(Toggle_Callback, Toggle_State)
				end
			end

			ToggleRow.MouseButton1Click:Connect(function()
				Toggle:Set(not Toggle_State)
			end)

			Render()

			return Toggle
		end

		function Tab:CreateSlider(SliderProperties)
			local Slider_Name = SliderProperties.Name or "Slider"
			local Slider_Min = SliderProperties.Min or 0
			local Slider_Max = SliderProperties.Max or 100
			local Slider_Suffix = SliderProperties.Suffix or ""
			local Slider_Step = SliderProperties.Step or 1
			local Slider_Callback = SliderProperties.Callback

			local function Snap(Value)
				return Slider_Min + math.floor((Value - Slider_Min) / Slider_Step + 0.5) * Slider_Step
			end

			local Slider_Value = math.clamp(Snap(SliderProperties.Default or Slider_Min), Slider_Min, Slider_Max)
			local Slider_Pct = (Slider_Value - Slider_Min) / (Slider_Max - Slider_Min)

			local function Format(Value)
				if Slider_Max - Slider_Min >= 10 then
					return tostring(math.floor(Value + 0.5)) .. Slider_Suffix
				end
				return tostring(math.floor(Value * 10 + 0.5) / 10) .. Slider_Suffix
			end

			local SliderRow =
				Create(
				"TextButton",
				{
				Parent = TabPage,
				Name = Slider_Name,
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.None,
				AutoButtonColor = false,
				BackgroundColor3 = Theme.SurfaceLight,
				BackgroundTransparency = 1,
				BorderColor3 = Theme.Stroke,
				BorderSizePixel = 0,
				LayoutOrder = #TabPage:GetChildren(),
				Position = UDim2.new(0, 0, 0, 0),
				Rotation = 0,
				Size = UDim2.new(1, 0, 0, 36),
				Text = "",
				Visible = true,
				ClipsDescendants = false
			}
			)

			local SliderLabel =
				Create(
				"TextLabel",
				{
				Parent = SliderRow,
				Name = "Label",
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.None,
				BackgroundColor3 = Theme.Text,
				BackgroundTransparency = 1,
				BorderColor3 = Theme.Stroke,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 10, 0, 0),
				Rotation = 0,
				Size = UDim2.new(0.6, 0, 0, 16),
				Visible = true,
				ClipsDescendants = false,
				FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold),
				Text = Slider_Name,
				TextColor3 = Theme.Text,
				TextSize = 13,
				TextStrokeColor3 = Theme.Background,
				TextStrokeTransparency = 1,
				TextTransparency = 0,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextWrapped = false,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			}
			)

			local SliderValueLabel =
				Create(
				"TextLabel",
				{
				Parent = SliderRow,
				Name = "Value",
				AnchorPoint = Vector2.new(1, 0),
				AutomaticSize = Enum.AutomaticSize.None,
				BackgroundColor3 = Theme.Text,
				BackgroundTransparency = 1,
				BorderColor3 = Theme.Stroke,
				BorderSizePixel = 0,
				Position = UDim2.new(1, -10, 0, 0),
				Rotation = 0,
				Size = UDim2.new(0.3, 0, 0, 16),
				Visible = true,
				ClipsDescendants = false,
				FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold),
				Text = Format(Slider_Value),
				TextColor3 = Theme.Accent,
				TextSize = 12,
				TextStrokeColor3 = Theme.Background,
				TextStrokeTransparency = 1,
				TextTransparency = 0,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextWrapped = false,
				TextXAlignment = Enum.TextXAlignment.Right,
				TextYAlignment = Enum.TextYAlignment.Center
			}
			)

			local SliderTrack =
				Create(
				"Frame",
				{
				Parent = SliderRow,
				Name = "Track",
				AnchorPoint = Vector2.new(0, 1),
				AutomaticSize = Enum.AutomaticSize.None,
				BackgroundColor3 = Theme.SurfaceLight,
				BackgroundTransparency = 0,
				BorderColor3 = Theme.Stroke,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 10, 1, -8),
				Rotation = 0,
				Size = UDim2.new(1, -20, 0, 4),
				Visible = true,
				ClipsDescendants = false
			}
			)

			local SliderTrack_UICorner =
				Create(
				"UICorner",
				{
				Parent = SliderTrack,
				CornerRadius = UDim.new(1, 0)
			}
			)

			local SliderFill =
				Create(
				"Frame",
				{
				Parent = SliderTrack,
				Name = "Fill",
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.None,
				BackgroundColor3 = Theme.Accent,
				BackgroundTransparency = 0,
				BorderColor3 = Theme.Stroke,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, 0),
				Rotation = 0,
				Size = UDim2.new(Slider_Pct, 0, 1, 0),
				Visible = true,
				ClipsDescendants = false
			}
			)

			local SliderFill_UICorner =
				Create(
				"UICorner",
				{
				Parent = SliderFill,
				CornerRadius = UDim.new(1, 0)
			}
			)

			local SliderKnob =
				Create(
				"Frame",
				{
				Parent = SliderTrack,
				Name = "Knob",
				AnchorPoint = Vector2.new(0.5, 0.5),
				AutomaticSize = Enum.AutomaticSize.None,
				BackgroundColor3 = Theme.Text,
				BackgroundTransparency = 0,
				BorderColor3 = Theme.Stroke,
				BorderSizePixel = 0,
				Position = UDim2.new(Slider_Pct, 0, 0.5, 0),
				Rotation = 0,
				Size = UDim2.new(0, 12, 0, 12),
				Visible = true,
				ClipsDescendants = false
			}
			)

			local SliderKnob_UICorner =
				Create(
				"UICorner",
				{
				Parent = SliderKnob,
				CornerRadius = UDim.new(1, 0)
			}
			)

			local function Render(Animate)
				local TargetSize = UDim2.new(Slider_Pct, 0, 1, 0)
				local TargetPos = UDim2.new(Slider_Pct, 0, 0.5, 0)
				if Animate then
					CreateTween(SliderFill, 0.15, Enum.EasingStyle.Exponential, {
						Size = TargetSize
					})
					CreateTween(SliderKnob, 0.15, Enum.EasingStyle.Exponential, {
						Position = TargetPos
					})
				else
					SliderFill.Size = TargetSize
					SliderKnob.Position = TargetPos
				end
			end

			local function SetValue(Value, Animate, Fire)
				Slider_Value = math.clamp(Snap(Value), Slider_Min, Slider_Max)
				if Slider_Max - Slider_Min ~= 0 then
					Slider_Pct = (Slider_Value - Slider_Min) / (Slider_Max - Slider_Min)
				else
					Slider_Pct = 0
				end
				SliderValueLabel.Text = Format(Slider_Value)
				Render(Animate)
				if Fire and Slider_Callback then
					task.spawn(Slider_Callback, Slider_Value)
				end
			end

			local function UpdateFromInput(MouseX)
				local Rel = (MouseX - SliderTrack.AbsolutePosition.X) / SliderTrack.AbsoluteSize.X
				SetValue(Slider_Min + math.clamp(Rel, 0, 1) * (Slider_Max - Slider_Min), false, true)
			end

			local Slider = {}

			function Slider:Get()
				return Slider_Value
			end

			function Slider:Set(Value)
				SetValue(Value, true, false)
			end

			local Dragging = false
			SliderRow.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					Dragging = true
					UpdateFromInput(Input.Position.X)
				end
			end)

			UserInputService.InputEnded:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					Dragging = false
				end
			end)

			UserInputService.InputChanged:Connect(function(Input)
				if Dragging and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
					UpdateFromInput(Input.Position.X)
				end
			end)

			Render(false)

			return Slider
		end

		function Tab:CreateTextbox(TextboxProperties)
			local Textbox_Name = TextboxProperties.Name or "Textbox"
			local Textbox_Placeholder = TextboxProperties.Placeholder or ""
			local Textbox_Default = TextboxProperties.Default or ""
			local Textbox_Callback = TextboxProperties.Callback

			local TextboxRow =
				Create(
				"Frame",
				{
				Parent = TabPage,
				Name = Textbox_Name,
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.None,
				BackgroundColor3 = Theme.SurfaceLight,
				BackgroundTransparency = 1,
				BorderColor3 = Theme.Stroke,
				BorderSizePixel = 0,
				LayoutOrder = #TabPage:GetChildren(),
				Position = UDim2.new(0, 0, 0, 0),
				Rotation = 0,
				Size = UDim2.new(1, 0, 0, 30),
				Visible = true,
				ClipsDescendants = false
			}
			)

			local TextboxLabel =
				Create(
				"TextLabel",
				{
				Parent = TextboxRow,
				Name = "Label",
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.None,
				BackgroundColor3 = Theme.Text,
				BackgroundTransparency = 1,
				BorderColor3 = Theme.Stroke,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 10, 0, 0),
				Rotation = 0,
				Size = UDim2.new(0.4, 0, 1, 0),
				Visible = true,
				ClipsDescendants = false,
				FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold),
				Text = Textbox_Name,
				TextColor3 = Theme.Text,
				TextSize = 13,
				TextStrokeColor3 = Theme.Background,
				TextStrokeTransparency = 1,
				TextTransparency = 0,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextWrapped = false,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			}
			)

			local TextboxInput =
				Create(
				"TextBox",
				{
				Parent = TextboxRow,
				Name = "Input",
				AnchorPoint = Vector2.new(1, 0.5),
				AutomaticSize = Enum.AutomaticSize.None,
				BackgroundColor3 = Theme.SurfaceLight,
				BackgroundTransparency = 0.25,
				BorderColor3 = Theme.Stroke,
				BorderSizePixel = 0,
				ClearTextOnFocus = false,
				FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Medium),
				PlaceholderColor3 = Theme.Dim,
				PlaceholderText = Textbox_Placeholder,
				Position = UDim2.new(1, -10, 0.5, 0),
				Rotation = 0,
				Size = UDim2.new(0.5, 0, 0, 24),
				Text = Textbox_Default,
				TextColor3 = Theme.Text,
				TextSize = 12,
				TextStrokeColor3 = Theme.Background,
				TextStrokeTransparency = 1,
				TextTransparency = 0,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextWrapped = false,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				Visible = true,
				ClipsDescendants = true
			}
			)

			local TextboxInput_UICorner =
				Create(
				"UICorner",
				{
				Parent = TextboxInput,
				CornerRadius = UDim.new(0, 6)
			}
			)

			local TextboxInput_UIPadding =
				Create(
				"UIPadding",
				{
				Parent = TextboxInput,
				PaddingLeft = UDim.new(0, 8),
				PaddingRight = UDim.new(0, 8)
			}
			)

			local Textbox = {}

			function Textbox:Get()
				return TextboxInput.Text
			end

			function Textbox:Set(Value)
				TextboxInput.Text = Value
			end

			TextboxInput.FocusLost:Connect(function(EnterPressed)
				if EnterPressed and Textbox_Callback then
					task.spawn(Textbox_Callback, TextboxInput.Text)
				end
			end)

			return Textbox
		end

		function Tab:CreateLabel(LabelProperties)
			local Label_Text = LabelProperties.Text or LabelProperties.Name or "Label"

			local LabelRow =
				Create(
				"Frame",
				{
				Parent = TabPage,
				Name = Label_Text,
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.None,
				BackgroundColor3 = Theme.Text,
				BackgroundTransparency = 1,
				BorderColor3 = Theme.Stroke,
				BorderSizePixel = 0,
				LayoutOrder = #TabPage:GetChildren(),
				Position = UDim2.new(0, 0, 0, 0),
				Rotation = 0,
				Size = UDim2.new(1, 0, 0, 18),
				Visible = true,
				ClipsDescendants = false
			}
			)

			local LabelText =
				Create(
				"TextLabel",
				{
				Parent = LabelRow,
				Name = "Text",
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.None,
				BackgroundColor3 = Theme.Text,
				BackgroundTransparency = 1,
				BorderColor3 = Theme.Stroke,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 10, 0, 0),
				Rotation = 0,
				Size = UDim2.new(1, -20, 1, 0),
				Visible = true,
				ClipsDescendants = false,
				FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold),
				Text = Label_Text,
				TextColor3 = Theme.Dim,
				TextSize = 12,
				TextStrokeColor3 = Theme.Background,
				TextStrokeTransparency = 1,
				TextTransparency = 0,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextWrapped = false,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			}
			)

			local Label = {}

			function Label:SetText(Value)
				LabelText.Text = Value
				LabelRow.Name = Value
			end

			function Label:Get()
				return LabelText.Text
			end

			return Label
		end

		function Tab:CreateText(TextProperties)
			local Text_Value = TextProperties.Text or TextProperties.Name or "Text"

			local TextRow =
				Create(
				"Frame",
				{
				Parent = TabPage,
				Name = Text_Value,
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = Theme.Text,
				BackgroundTransparency = 1,
				BorderColor3 = Theme.Stroke,
				BorderSizePixel = 0,
				LayoutOrder = #TabPage:GetChildren(),
				Position = UDim2.new(0, 0, 0, 0),
				Rotation = 0,
				Size = UDim2.new(1, 0, 0, 0),
				Visible = true,
				ClipsDescendants = false
			}
			)

			local TextLabel =
				Create(
				"TextLabel",
				{
				Parent = TextRow,
				Name = "Text",
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = Theme.Text,
				BackgroundTransparency = 1,
				BorderColor3 = Theme.Stroke,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 10, 0, 0),
				Rotation = 0,
				Size = UDim2.new(1, -20, 0, 0),
				Visible = true,
				ClipsDescendants = false,
				FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Medium),
				Text = Text_Value,
				TextColor3 = Theme.Text,
				TextSize = 13,
				TextStrokeColor3 = Theme.Background,
				TextStrokeTransparency = 1,
				TextTransparency = 0,
				TextTruncate = Enum.TextTruncate.None,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			}
			)

			local Text = {}

			function Text:SetText(Value)
				TextLabel.Text = Value
			end

			function Text:Get()
				return TextLabel.Text
			end

			return Text
		end

		function Tab:CreateButton(ButtonProperties)
			local Button_Name = ButtonProperties.Name or "Button"
			local Button_Callback = ButtonProperties.Callback

			local ButtonRow =
				Create(
				"TextButton",
				{
				Parent = TabPage,
				Name = Button_Name,
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.None,
				AutoButtonColor = false,
				BackgroundColor3 = Color3.fromRGB(78, 181, 195),
				BackgroundTransparency = 0,
				BorderColor3 = Theme.Stroke,
				BorderSizePixel = 0,
				LayoutOrder = #TabPage:GetChildren(),
				Position = UDim2.new(0, 0, 0, 0),
				Rotation = 0,
				Size = UDim2.new(1, 0, 0, 26),
				Text = "",
				Visible = true,
				ClipsDescendants = false
			}
			)

			local ButtonRow_UICorner =
				Create(
				"UICorner",
				{
				Parent = ButtonRow,
				CornerRadius = UDim.new(0, 6)
			}
			)

			local ButtonText =
				Create(
				"TextLabel",
				{
				Parent = ButtonRow,
				Name = "Text",
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.None,
				BackgroundColor3 = Color3.fromRGB(115, 117, 120),
				BackgroundTransparency = 1,
				BorderColor3 = Theme.Stroke,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 10, 0, 0),
				Rotation = 0,
				Size = UDim2.new(1, -20, 1, 0),
				Visible = true,
				ClipsDescendants = false,
				FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold),
				Text = Button_Name,
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextSize = 13,
				TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
				TextStrokeTransparency = 0.90,
				TextTransparency = 0,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextWrapped = false,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center
			}
			)

			ButtonRow.MouseEnter:Connect(function()
				CreateTween(ButtonRow, 0.2, Enum.EasingStyle.Exponential, {
					BackgroundTransparency = 0.15
				})
			end)

			ButtonRow.MouseLeave:Connect(function()
				CreateTween(ButtonRow, 0.2, Enum.EasingStyle.Exponential, {
					BackgroundTransparency = 0
				})
			end)

			ButtonRow.MouseButton1Click:Connect(function()
				if Button_Callback then
					task.spawn(Button_Callback)
				end
			end)

			local Button = {}

			function Button:SetText(Value)
				ButtonText.Text = Value
			end

			function Button:Get()
				return ButtonText.Text
			end

			return Button
		end

		TabButton.MouseEnter:Connect(function()
			if Tab ~= ActiveTab then
				TabIcon.ImageColor3 = Theme.Text
				TabIcon.ImageTransparency = 0
			end
		end)

		TabButton.MouseLeave:Connect(function()
			if Tab ~= ActiveTab then
				TabIcon.ImageColor3 = Theme.Dim
				TabIcon.ImageTransparency = 0.35
			end
		end)

		TabButton.MouseButton1Click:Connect(function()
			SetActiveTab(Tab)
		end)

		if TabProperties.First then
			SetActiveTab(Tab)
		elseif ActiveTab == nil then
			SetActiveTab(Tab)
		end

		return Tab
	end

	Window.Console = Console
	Window.Tabs = Tabs

	function Window:SetVisible(IsVisible)
		Window.Frame.Visible = IsVisible
	end

	function Window:Toggle()
		Window.Frame.Visible = not Window.Frame.Visible
	end

	function Window:Destroy()
		ScreenGui:Destroy()
	end

	dragGUI(ConsoleHeader, Window.Frame)
	dragGUI(TabBar, Window.Frame)

	if Window_Keybind then
		UserInputService.InputBegan:Connect(function(Input, GameProcessed)
			if GameProcessed then
				return
			end
			if Input.KeyCode == Window_Keybind then
				Window:Toggle()
			end
		end)
	end

	return Window
end

return Library
