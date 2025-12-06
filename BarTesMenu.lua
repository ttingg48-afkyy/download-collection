--=========================================================
--  BARALEAKS UI — FIXED MINIMIZE + FIXED HEADER IMAGE
--=========================================================

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)

local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 500, 0, 300)
Main.Position = UDim2.new(0.25, 0, 0.25, 0)
Main.BackgroundColor3 = Color3.fromRGB(35,35,35)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

--======================= HEADER ===========================

local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 50)
Header.BackgroundColor3 = Color3.fromRGB(25,25,25)

-- FOTO OWNER SAMPING TITLE
local HeaderImg = Instance.new("ImageLabel", Header)
HeaderImg.Size = UDim2.new(0, 40, 0, 40)
HeaderImg.Position = UDim2.new(0, 5, 0, 5)
HeaderImg.BackgroundTransparency = 1
HeaderImg.Image = "rbxassetid://7229442422"

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 55, 0, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.TextColor3 = Color3.fromRGB(230,230,230)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Text = "BaraLeaks | Owner Tampan"

-- CLOSE BUTTON
local X = Instance.new("TextButton", Header)
X.Size = UDim2.new(0, 35, 1, 0)
X.Position = UDim2.new(1, -40, 0, 0)
X.Text = "X"
X.TextColor3 = Color3.fromRGB(255,255,255)
X.BackgroundTransparency = 1
X.Font = Enum.Font.GothamBold
X.TextSize = 20
X.MouseButton1Click:Connect(function()
	Main.Visible = false
end)

-- MINIMIZE BUTTON (REAL FIX)
local Min = Instance.new("TextButton", Header)
Min.Size = UDim2.new(0, 35, 1, 0)
Min.Position = UDim2.new(1, -80, 0, 0)
Min.Text = "-"
Min.TextColor3 = Color3.fromRGB(255,255,255)
Min.BackgroundTransparency = 1
Min.Font = Enum.Font.GothamBold
Min.TextSize = 24

--======================= CONTENT WRAPPER =====================
-- Biar minimize hanya hide frame ini (AMAN, GA FREEZE)

local ContentWrapper = Instance.new("Frame", Main)
ContentWrapper.Size = UDim2.new(1, 0, 1, -50)
ContentWrapper.Position = UDim2.new(0, 0, 0, 50)
ContentWrapper.BackgroundTransparency = 1

local TableHolder = Instance.new("Frame", ContentWrapper)
TableHolder.Size = UDim2.new(1, 0, 1, 0)
TableHolder.BackgroundTransparency = 1

local List = Instance.new("UIListLayout", TableHolder)
List.SortOrder = Enum.SortOrder.LayoutOrder
List.Padding = UDim.new(0, 2)

-- MINIMIZE FIX (TIDAK MENYENTUH HEADER / LISTLAYOUT)
local Minimized = false
Min.MouseButton1Click:Connect(function()
	Minimized = not Minimized
	
	ContentWrapper.Visible = not Minimized
	
	Main.Size = Minimized
		and UDim2.new(0, 500, 0, 50)
		or  UDim2.new(0, 500, 0, 300)
end)

--======================= DATA ===============================

local Features = {
	{
		Title = "Info Owner",
		Content = "Developer : Bara Tamvan\nTeam : BarLens Studio",
		Image = "rbxassetid://7229442422"
	},
	{ Title = "Coming Soon", Content = "Segera Hadir", Image = "" },
	{ Title = "Coming Soon", Content = "Segera Hadir", Image = "" },
}

--======================= ROW BUILDER =========================

for _, data in ipairs(Features) do
	
	local Row = Instance.new("Frame", TableHolder)
	Row.Size = UDim2.new(1, 0, 0, 40)
	Row.BackgroundColor3 = Color3.fromRGB(50,50,50)

	local Ftxt = Instance.new("TextLabel", Row)
	Ftxt.Size = UDim2.new(0.5, -10, 1, 0)
	Ftxt.Position = UDim2.new(0, 10, 0, 0)
	Ftxt.BackgroundTransparency = 1
	Ftxt.Font = Enum.Font.GothamBold
	Ftxt.TextSize = 18
	Ftxt.TextColor3 = Color3.fromRGB(255,255,255)
	Ftxt.TextXAlignment = Enum.TextXAlignment.Left
	Ftxt.Text = data.Title

	local Toggle = Instance.new("TextButton", Row)
	Toggle.Size = UDim2.new(0.5, -10, 1, 0)
	Toggle.Position = UDim2.new(0.5, 0, 0, 0)
	Toggle.BackgroundTransparency = 1
	Toggle.Font = Enum.Font.GothamBold
	Toggle.TextSize = 18
	Toggle.TextColor3 = Color3.fromRGB(255,255,255)
	Toggle.Text = "▼"

	local Panel = Instance.new("Frame", Row)
	Panel.Size = UDim2.new(1, 0, 0, 0)
	Panel.BackgroundColor3 = Color3.fromRGB(40,40,40)
	Panel.BorderSizePixel = 0
	Panel.Visible = false

	local Ptxt = Instance.new("TextLabel", Panel)
	Ptxt.Size = UDim2.new(1, -90, 1, 0)
	Ptxt.Position = UDim2.new(0, 80, 0, 10)
	Ptxt.BackgroundTransparency = 1
	Ptxt.Font = Enum.Font.Gotham
	Ptxt.TextColor3 = Color3.fromRGB(200,200,200)
	Ptxt.TextSize = 16
	Ptxt.TextXAlignment = Enum.TextXAlignment.Left
	Ptxt.TextYAlignment = Enum.TextYAlignment.Top
	Ptxt.Text = data.Content

	if data.Image ~= "" then
		local Img = Instance.new("ImageLabel", Panel)
		Img.Size = UDim2.new(0, 60, 0, 60)
		Img.Position = UDim2.new(0, 10, 0, 10)
		Img.BackgroundTransparency = 1
		Img.Image = data.Image
	end

	local Expanded = false
	Toggle.MouseButton1Click:Connect(function()
		Expanded = not Expanded
		Panel.Visible = Expanded

		Toggle.Text = Expanded and "▲" or "▼"

		if Expanded then
			Row.Size = UDim2.new(1,0,0,140)
			Panel.Size = UDim2.new(1,0,0,100)
		else
			Row.Size = UDim2.new(1,0,0,40)
			Panel.Size = UDim2.new(1,0,0,0)
		end
	end)
end
