local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()

local Window = redzlib:MakeWindow({
  Title = "Chapéu Hub: Brookhaven RP",
  SubTitle = "by Theus999",
  SaveFolder = "testando | redz lib v5.lua"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://90916833778554", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

local Tab1 = Window:MakeTab({"Main", "rbxassetid://128706247346129"})

Tab1:AddDiscordInvite({
    Name = "Chapéu Hub",
    Description = "Join server",
    Logo = "rbxassetid://90916833778554",
    Invite = "https://discord.gg/aSkRnvp2F",
})

local Paragraph = Tab1:AddParagraph({"", "Versão 0.1 \nVersão de testes"})

local Tab7 = Window:MakeTab({"Audio All", "radio"})

local loopAtivo = false
local InputID = ""

Tab7:AddTextBox({
    Name = "Insira o ID Audio All",
    Description = "Digite o ID do som que deseja tocar",
    Default = "",
    PlaceholderText = "Exemplo: 6832470734",
    ClearTextOnFocus = true,
    Callback = function(text)
        InputID = tonumber(text)
    end
})

local function fireServer(eventName, args)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local event = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild(eventName)
    if event then
        pcall(function()
            event:FireServer(unpack(args))
        end)
    end
end

Tab7:AddButton({
    Name = "Tocar Som",
    Description = "Clique para tocar a música inserida",
    Callback = function()
        if InputID then
            fireServer("1Gu1nSound1s", {Workspace, InputID, 1})
            local globalSound = Instance.new("Sound", Workspace)
            globalSound.SoundId = "rbxassetid://" .. InputID
            globalSound.Looped = false
            globalSound:Play()
            task.wait(3)
            globalSound:Destroy()
        end
    end
})

Tab7:AddToggle({
    Name = "Loop",
    Description = "Ative para colocar o som em loop",
    Default = false,
    Callback = function(state)
        loopAtivo = state
        if loopAtivo then
            spawn(function()
                while loopAtivo do
                    if InputID then
                        fireServer("1Gu1nSound1s", {Workspace, InputID, 1})
                        local globalSound = Instance.new("Sound", Workspace)
                        globalSound.SoundId = "rbxassetid://" .. InputID
                        globalSound.Looped = false
                        globalSound:Play()
                        task.spawn(function()
                            task.wait(3)
                            globalSound:Destroy()
                        end)
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

-- Dropdowns para Tab6
local function createSoundDropdown(title, musicOptions, defaultOption)
    local musicNames = {}
    local categoryMap = {}
    for category, sounds in pairs(musicOptions) do
        for _, music in ipairs(sounds) do
            if music.name ~= "" and music.id ~= "4354908569" then
                table.insert(musicNames, music.name)
                categoryMap[music.name] = {id = music.id, category = category}
            end
        end
    end

    local selectedSoundID = nil
    local currentVolume = 1
    local currentPitch = 1

    local function playSound(soundId, volume, pitch)
        fireServer("1Gu1nSound1s", {Workspace, soundId, volume})
        local globalSound = Instance.new("Sound")
        globalSound.Parent = Workspace
        globalSound.SoundId = "rbxassetid://" .. soundId
        globalSound.Volume = volume
        globalSound.Pitch = pitch
        globalSound.Looped = false
        globalSound:Play()
        task.spawn(function()
            task.wait(3)
            globalSound:Destroy()
        end)
    end

    Tab7:AddDropdown({
        Name = title,
        Description = "Escolha um som para tocar no servidor",
        Default = defaultOption,
        Multi = false,
        Options = musicNames,
        Callback = function(selectedSound)
            if selectedSound and categoryMap[selectedSound] then
                selectedSoundID = categoryMap[selectedSound].id
            else
                selectedSoundID = nil
            end
        end
    })

    Tab7:AddButton({
        Name = "Tocar Som Selecionado",
        Description = "Clique para tocar o som do dropdown",
        Callback = function()
            if selectedSoundID then
                playSound(selectedSoundID, currentVolume, currentPitch)
            end
        end
    })

    local dropdownLoopActive = false
    Tab7:AddToggle({
        Name = "Loop",
        Description = "Ativa o loop do som selecionado",
        Default = false,
        Callback = function(state)
            dropdownLoopActive = state
            if state then
                task.spawn(function()
                    while dropdownLoopActive do
                        if selectedSoundID then
                            playSound(selectedSoundID, currentVolume, currentPitch)
                        end
                        task.wait(1)
                    end
                end)
            end
        end
    })
end

-- Dropdown "Memes"
createSoundDropdown("Selecione um meme", {
    ["Memes"] = {
        {name = "pankapakan", id = "122547522269143"}, 
       
        {name = "Gemido ultra rápido", id = "128863565301778"},
        {name = "vai g0z@?", id = "116293771329297"},
        {name = "G0z33iiii", id = "93462644278510"},
        {name = "Hommmm ", id = "133135656929513"},
        {name = "gemido1", id = "105263704862377"},
        {name = " gemido2", id = "92186909873950"},
        {name = "sus sex", id = "128137573022197"},
        {name = "gemido estranho", id = "131219411501419"},
        {name = "gemido kawai", id = "100409245129170"},
        {name = "Hentai wiaaaaan", id = "88332347208779"},
        {name = "iamete cunasai", id = "108494476595033"},
        {name = "dodichan onnn...", id = "134640594695384"},
        {name = "Loly gemiD0", id = "119277017538197"},
         {name = "ai poison", id = "115870718113313"},
         {name = "chegachega SUS", id = "77405864184828"},
         {name = "uwu", id = "76820720070248"},
         {name = "ai meu cuzin", id = "130714479795369"},
         {name = "girl audio 2", id = "84207358477461"},
        {name = "Hoo ze da manga", id = "106624090319571"},
        {name = "ai alexandre de moraes", id = "107261471941570"},
        {name = "haaii meme", id = "120006672159037"},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
 
    


        {name = "GoGogo gogogo", id = "103262503950995"},
        {name = "Toma jack", id = "132603645477541"},
        {name = "Toma jackV2", id = "100446887985203"},
        {name = "Toma jack no sol quente", id = "97476487963273"},
        {name = "ifood", id = "133843750864059"},
        {name = "pelo geito ela ta querendo ram", id = "94395705857835"},
        {name = "lula vai todo mundo", id = "136804576009416"},
        {name = "coringa", id = "84663543883498"},
        {name = "shoope", id = "8747441609"},
        {name = "quenojo", id = "103440368630269"},
        {name = "sai dai lava prato", id = "101232400175829"},
        {name = "se e loko numconpeça", id = "78442476709262"},
        {name = "mita sequer que eu too uma", id = "94889439372168"},
        {name = "Hoje vou ser tua mulher e tu", id = "90844637105538"},
        {name = "Deita aqui eu mandei vc deitar sirens", id = "100291188941582"},
        {name = "miau", id = "131804436682424"},
        {name = "skibidi", id = "128771670035179"},
        {name = "BIRULEIBI", id = "121569761604968"},
        {name = "biseabesjnjkasnakjsndjkafb", id = "133106998846260"},
        {name = "vai corinthians!!....", id = "127012936767471"},
        {name = "my sigman", id = "103431815659907"},
        {name = "mama", id = "106850066985594"},
        {name = "OH MY GOD", id = "73349649774476"},
        {name = "aahhh plankton meme", id = "95982351322190"},
        {name = "CHINABOY", id = "84403553163931"},
        {name = "PASTOR MIRIM E A LÍNGUA DOS ANJOS", id = "71153532555470"},
        
        {name = "Sai d3sgraç@", id = "106973692977609"},
        
        {name = "opa salve tudo bem?", id = "80870678096428"},
        {name = "OLHA O CARRO DO DANONE", id = "110493863773948"},
        {name = "Nãoooo, Nãoooo, Nãooo!!!!!", id = "95825536480898"},
        {name = "UM PÉ DE SIRIGUELA KK", id = "112804043442210"},
        {name = "e o carro da pamonha", id = "94951629392683"},
        {name = "BOM DIAAAAAAAAAA", id = "136579844511260"},
        {name = "ai-meu-chiclete", id = "92911732806153"},
        {name = "posso te ligar ou tua mulher...", id = "103211341252816"},
        {name = "Boa chi joga muito cara", id = "110707564387669"},
        {name = "Oqueee meme", id = "120092799810101"},
        {name = "kkk muito fei", id = "79241074803021"},
        {name = "lula cade o ze gotinha", id = "86012585992725"},
        {name = "morreu", id = "8872409975"},
        {name = "a-pia-ta-cheia-de-louca", id = "98076927129047"},
        {name = "Mahito killSong", id = "128669424001766"},
        {name = "Sucumba", id = "7946300950"},
        {name = "nem clicou o thurzin", id = "84428355313544"},
        {name = "fiui OLHA MENSAGEM", id = "121668429878811"},
        {name = "tooomeee", id = "128319664118768"},
        {name = "risada de ladrao", id = "133065882609605"},
        {name = "E o PIX nada ainda", id = "113831443375212"},
        {name = "Vo nada vo nada", id = "89093085290586"},
        {name = "Eli gosta", id = "105012436535315"},
        {name = "um cavalo de tres pernas?", id = "8164241439"},
        {name = "voces sao um bado de fdp", id = "8232773326"},
        {name = "HAHA TROLLEI ATÉ VOCÊ", id = "7021794555"},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        
        

        {name = "Calaboca Kenga", id = "86494561679259"},
        {name = "alvincut", id = "88788640194373"},
        {name = "e a risada faz como?", id = "140713372459057"},
        {name = "voce deve se m@t4", id = "100227426848009"},
        {name = "receba", id = "94142662616215"},
        {name = "UUIIII", id = "73210569653520"},
        



        {name = "sai", id = "121169949217007"},
        {name = "risada boa dms", id = "127589011971759"},
        {name = "vacilo perna de pau", id = "106809680656199"},
        {name = "gomo gomo no!!!", id = "137067472449625"},
        {name = "arroto", id = "140203378050178"},
        {name = "iraaaa", id = "136752451575091"},
        {name = "não fica se achando muito não", id = "101588606280167"},
       
        {name = "WhatsApp notificaçaoV1", id = "107004225739474"},
        {name = "WhatsApp notificaçaoV2", id = "18850631582"},
        {name = "SamsungV1", id = "123767635061073"},
        {name = "SamsungV2", id = "96579234730244"}, 
        {name = "Shiiii", id = "120566727202986"},
        {name = "ai_tomaa miku", id = "139770074770361"},
        {name = "Miku Miku", id = "72812231495047"},
        {name = "kuru_kuru", id = "122465710753374"},
        {name = "PM ROCAM", id = "96161547081609"},
        {name = "cavalo!!", id = "78871573440184"},
        {name = "deixa os garoto brinca", id = "80291355054807"},
        {name = "flamengo", id = "137774355552052"},
        {name = "sai do mei satnas", id = "127944706557246"},
        {name = "namoral agora e a hora", id = "120677947987369"},
        {name = "n pode me chutar pq seu celebro e burro", id = "82284055473737"},
        {name = "vc ta fudido vou te pegar", id = "120214772725166"},
        {name = "deley", id = "102906880476838"},
        {name = "Tu e um beta", id = "130233956349541"},
        {name = "Porfavor n tira eu nao", id = "85321374020324"},
        {name = "Olá beleza vc pode me dá muitos", id = "74235334504693"},
        {name = "Discord sus", id = "122662798976905"},
        {name = "rojao apito", id = "6549021381"},
        {name = "off", id = "1778829098"},
        {name = "Kazuma kazuma", id = "127954653962405"},
        {name = "sometourado", id = "123592956882621"},
        {name = "Estouradoespad", id = "136179020015211"},
        {name = "Alaku bommm", id = "110796593805268"},
        {name = "busss", id = "139841197791567"},
        {name = "Estourado wItb", id = "137478052262430"},
        {name = "sla", id = "116672405522828"},
        {name = "HA HA HA", id = "138236682866721"}
    }
}, "pankapakan")



local Section = Tab7:AddSection({" tacar o terror ou efeito no server"})

-- Dropdown "Efeito/Terror"
createSoundDropdown("Selecione um terror ou efeito", {
    ["efeito/terror"] = {
        {name = "jumpscar", id = "91784486966761"},
        {name = "n se preocupe", id = "87041057113780"},
        {name = "eles estao todos mortos", id = "70605158718179"},

        {name = "gritoestourado", id = "7520729342"},
        {name = "gritomedo", id = "113029085566978"},
        {name = "Nukesiren", id = "9067330158"},
        {name = "nuclear sirenv2", id = "675587093"},
        {name = "Alertescola", id = "6607047008"},
        {name = "Memealertsiren", id = "8379374771"},
        {name = "sirenv3", id = "6766811806"},
        {name = "Alarm estourAAAA...", id = "93354528379052"},
        {name = "MegaMan Alarm", id = "1442382907"},
        {name = "Alarm bookhaven", id = "1526192493"},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},



        {name = "alet malaysia", id = "7714172940"},
        {name = "Risada", id = "79191730206814"},
        {name = "Hahahah", id = "90096947219465"},
        {name = "scream", id = "314568939"},
        {name = "Terrified meme scream", id = "5853668794"},
        {name = "Sonic.exe Scream Effect", id = "146563959"},
        {name = "Demon Scream", id = "2738830850"},
        {name = "SCP-096 Scream (raging)", id = "343430735"},
        {name = "Nightmare Yelling Bursts", id = "9125713501"},
        {name = "HORROR SCREAM 07", id = "9043345732"},
        {name = "Female Scream Woman Screams", id = "9114397912"},
        {name = "Scream1", id = "1319496541"},
        {name = "Scream2", id = "199978176"},
        {name = "scary maze scream", id = "270145703"},
        {name = "SammyClassicSonicFan's Scream", id = "143942090"},
        {name = "FNAF 2 Death Scream", id = "1572549161"},
        {name = "cod zombie scream", id = "8566359672"},
        {name = "Slendytubbies- CaveTubby Scream", id = "1482639185"},
        {name = "FNAF 2 Death Scream", id = "5537531920"},
        {name = "HORROR SCREAM 15", id = "9043346574"},
        {name = "Jumpscare Scream", id = "6150329916"},
        {name = "FNaF: Security Breach", id = "2050522547"},
        {name = "llllllll", id = "5029269312"},
        {name = "loud jumpscare", id = "7236490488"},
        {name = "fnaf", id = "6982454389"},
        {name = "Pinkamena Jumpscare 1", id = "192334186"},
        {name = "Ennard Jumpscare 2", id = "629526707"},
        {name = "a sla medo dino", id = "125506416092123"},
        {name = "Backrooms Bacteria Pitfalls ", id = "81325342128575"},
        
        {name = "error Infinite", id = "3893790326"},
        {name = "Screaming Meme", id = "107732411055226"},
        {name = "Jumpscare - SCP CB", id = "97098997494905"},
        {name = "mirror jumpscare", id = "80005164589425"},
        {name = "PTLD-39 Jumpscare", id = "5581462381"},
        {name = "jumpscare:Play()", id = "121519648044128"},
        {name = "mimic jumpscare", id = "91998575878959"},
        {name = "DOORS Glitch Jumpscare Sound", id = "96377507894391"},
        {name = "FNAS 4 Nightmare Mario", id = "99804224106385"},
        {name = "Death House I Jumpscare Sound", id = "8151488745"},
        {name = "Shinky Jumpscare", id = "123447772144411"},
        {name = "FNaTI Jumpscare Oblitus casa", id = "18338717319"},
        {name = "fnaf jumpscare loadmode", id = "18911896588"},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""}
    }
}, "jumpscar")

