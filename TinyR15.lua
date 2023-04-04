-- Loli was here~
local LocalPlayer = game:GetService("Players").LocalPlayer
local Character = LocalPlayer.Character
local Humanoid = Character:FindFirstChildOfClass("Humanoid")

local function rm()
    for i,v in pairs(Character:GetDescendants()) do
        if v:IsA("BasePart") then
            if v.Name ~= "Head" then
                for i,cav in pairs(v:GetDescendants()) do
                    if cav:IsA("Attachment") then
                        if cav:FindFirstChild("OriginalPosition") then
                            cav.OriginalPosition:Destroy()
                        end
                    end
                end
                v:FindFirstChild("OriginalSize"):Destroy()
                if v:FindFirstChild("AvatarPartScaleType") then
                    v:FindFirstChild("AvatarPartScaleType"):Destroy()
                end
            end
        end
    end
end

local PropertiesToRemove = {
    {"BodyTypeScale",0.5},
    {"BodyWidthScale",1},
    {"BodyDepthScale",1}
}

for _, property in pairs(PropertiesToRemove) do
    rm()
    task.wait()
    Humanoid:FindFirstChild(property[1]):Destroy()
    task.wait(property[2])
end
