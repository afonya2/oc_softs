local com = require("component")
if com.isAvailable("gpu") == false then
    print("component not found: gpu")
    os.exit()
end
if com.isAvailable("internet") == false then
    print("component not found: internet")
    os.exit()
end
local gpu = com.gpu
local fs = require("filesystem")
local ser = require("serialization")
local event = require("event")
local thread = require("thread")
local colors = require("colors")
local shell = require("shell")

function runcmd(data)
    shell.execute(data)
end

function getle(table) 
    local le = 0
    for k,v in pairs(table) do
        le = le + 1
    end
    return le
end

function bar(x,y,dat,max)
    local i = 1
    while i < max do
        i = i + 1
        bar.gpu.setForeground(0xe02514)
        bar.gpu.set(x + i - 1,y,"█")
    end
    i = 1
    while i < dat do
        i = i + 1
        bar.gpu.setForeground(0x34e00d)
        bar.gpu.set(x + i - 1,y,"█")
    end
end

inst = {["serverc_server"]={"server.lua","https://raw.githubusercontent.com/afonya2/oc_wifiserver_client/main/server.lua"},["serverc_client"]={"serverclient.lua","https://raw.githubusercontent.com/afonya2/oc_wifiserver_client/main/server_client.lua"}}

gpu.setBackground(colors.blue, true)
runcmd("clear")
print("enter the want soft >> ")
local asd = io.read()
print("where want to install >> ")
local asda = io.read()

if asd == "ls" then
    local iu = 1
    while iu < getle(inst) + 1 do
        print(inst[iu])
    end
end

local i = 1
local nyam = false
while i < getle(inst) + 1 do
    if inst[asd] then
        nyam = true
        print(inst[asd][1])
        print("accept this shit?")
        local acc = io.read()
        if acc == "y" then
            local ia = 2
            while ia < getle(inst[asd]) + 1 do
                print("downloading file: "..inst[asd][ia+1].." ...")
                runcmd("wget "..inst[asd][ia+1].." /home/"..asda.."/"..inst[asd][ia])
                print("ok!")
                ia = ia + 1
                ia = ia + 1
            end
            print("done!")
            os.exit()
        else
            print("Why not accept this shit?")
            os.exit()
        end
    end
    i = i + 1
end
if nyam == false then
    print("not found this: "..asd)
    os.exit()
end


