
menu.add_int("clantag", 0)
menu.combo(GLOBAL_SCRIPTID, "Clantag", "clantag", {"Off", "fatality", "neopredelenu", "Onetap", "Plaguecheat.cc", "gamesense", "Neverlose.cc"})

local clantag_enabled = true;

local function clantags()

    if i_engine_client.IsConnected() and i_engine_client.IsInGame() then

        if menu.get_int("clantag") == 0 and clantag_enabled then
    
        cheat.set_clantag("ZexusFuckAll")    
        clantag_enabled = false;
    
        elseif menu.get_int("clantag") == 1 then 
    
            local clantag_fatality = {
            " ",
            "f|",
            "fa|",
            "fat|",
            "fata|",
            "fatal|",
            "fatali|",
            "fatalit|",
            "fatality",
            "fatality",
            "fatality",
            "fatality",
            "fatalit|",
            "fatali|",
            "fatal|",
            "fata|",
            "fat|",
            "fa|",
            "f|",
            " ",
            }

            elseif menu.get_int("clantag") == 2 then 
    
            local clantag_neopredelenu = {
            " INTERIUM? ",
            " SKEET.cc?  ",
            " OSIRIS?   ",
            " RAWETRIP?   ",
            " EVOLVE.XUZ? ",
            " FATALITY?   ",
            " GAMESENSE?  ",
            " W1NNER.PW?  ",
            " MIDNIGHT?   ",
            " XONE?      ",
            " NEVERLOSE?  ",
            " NIXWARE?    ",
            " WEAVE.SU?   ",
            " OTCV3?      ",
            " AURORA?     ",
            " ExtrimHack? ",
            " FluidAim?   ",
            " OTCV4?     ",
            " Qo0?        ",
            " SpirtHack?  ",
            }

            elseif menu.get_int("clantag") == 3 then 

            local clantag_Onetap = {
                "",
                "O",
                "On",
                "One",
                "Onet",
                "Oneta",
                "Onetap",
                "Onetap.",
                "Onetap.s",
                "Onetap.su",
                "Onetap.s",
                "Onetap.",
                "Onetap",
                "Oneta",
                "Onet",
                "One",
                "On",
                "O",
                "",
            }

            local curtime = math.floor((i_global_vars.GetCurTime()) * 3)
            local clantag_string = clantag_fatality[curtime % #clantag_fatality + 1]
            if clantag_string ~= old_clantag_string then
                cheat.set_clantag(clantag_string)
                old_clantag_string = clantag_string
            end

            local curtime = math.floor((i_global_vars.GetCurTime()) * 3)
            local clantag_string = clantag_Onetap[curtime % #clantag_Onetap + 1]
            if clantag_string ~= old_clantag_string then
                cheat.set_clantag(clantag_string)
                old_clantag_string = clantag_string
            end

            local curtime = math.floor((i_global_vars.GetCurTime()) * 3.5)
            local clantag_string = clantag_neopredelenu[curtime % #clantag_neopredelenu + 1]
            if clantag_string ~= old_clantag_string then
                cheat.set_clantag(clantag_string)
                old_clantag_string = clantag_string
            end
        end
    end
end

cheat.add_hook_callback(GLOBAL_SCRIPTID, "draw", clantags)
