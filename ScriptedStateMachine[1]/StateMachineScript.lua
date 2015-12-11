
--seed the random number generator so we get different outputs
math.randomseed(os.time())

-------------------------------------------------------------------------------

-- create the GoHome state

-------------------------------------------------------------------------------
State_GoHome = {}


State_GoHome["Enter"] = function(miner)

--function to get random saying for heading home
function GetDialog()

--create table of different sayings
local int_to_dialog={"[Lua]: Walkin home in the hot n' thusty heat of the desert",
                     "[Lua]: Headen to muh house, gotta get outta this heat",
                     "[Lua]: Gettin out this crazy heat"}
               
return int_to_dialog[math.random(3)]
end

 print(GetDialog())
 end

State_GoHome["Execute"] = function(miner)

--function to get random saying for entering house
function GetDialog()

--create table of different sayings
local int_to_dialog={"[Lua]: Back at the shack. yer siree!",
                     "[Lua]: Ain't no place like home",
                     "[Lua]: Feels good bein home"}
               
return int_to_dialog[math.random(3)]
end

 print(GetDialog())
 
if miner:Fatigued() then

    miner:GetFSM():ChangeState(State_Sleep)

  else

    miner:GetFSM():ChangeState(State_GoToMine)

  end

end

  
State_GoHome["Exit"] = function(miner)

  --function to get random saying for going to mine
function GetDialog()

--create table of different sayings
local int_to_dialog={"[Lua]: Puttin' mah boots on n' gettin' ready for a day at the mine",
                     "[Lua]: Gotta get dat gold",
                     "[Lua]: Worken in da mine today"}
               
return int_to_dialog[math.random(3)]
end

 print(GetDialog())
  

end



-------------------------------------------------------------------------------

-- create the Sleep state

-------------------------------------------------------------------------------

State_Sleep = {}


State_Sleep["Enter"] = function(miner)

    --function to get random saying for going to sleep
function GetDialog()

--create table of different sayings
local int_to_dialog={"[Lua]: Miner "..miner:Name().." is dozin off",
                     "[Lua]: Miner "..miner:Name().." is gonna catch some zzzzz's",
                     "[Lua]: Miner "..miner:Name().." sure is sleepy"}
               
return int_to_dialog[math.random(3)]
end

 print(GetDialog())
 
 end


State_Sleep["Execute"] = function(miner)

  if miner:Fatigued() then
  
      --function to get random snores
function GetDialog()

--create table of different sayings
local int_to_dialog={"[Lua]: ZZZZZZ... ",
                     "[Lua]: SSSHHH...",
                     "[Lua]: HMRPH...HMRPH..."}
               
return int_to_dialog[math.random(3)]
end

 print(GetDialog())

  miner:DecreaseFatigue()

  else

    miner:GetFSM():ChangeState(State_GoToMine)

  end

end

State_Sleep["Exit"] = function(miner)

 local int_to_dialog={"[Lua]: Miner "..miner:Name().." is feelin' mighty refreshed!",
                     "[Lua]: Miner "..miner:Name().." is fulla energy again!",
                     "[Lua]: Miner "..miner:Name().." is ready to get back at it!"}


end


-------------------------------------------------------------------------------

-- create the GoToMine state

-------------------------------------------------------------------------------


State_GoToMine = {}


State_GoToMine["Enter"] = function(miner)

  local int_to_dialog={"[Lua]: Miner "..miner:Name().." enters goldmine",
                     "[Lua]: Miner "..miner:Name().." is getten back to work, diggin gold",
                     "[Lua]: Miner "..miner:Name().." is back at the workplace"}

end


State_GoToMine["Execute"] = function(miner)

  miner:IncreaseFatigue()

  miner:AddToGoldCarried(2)

  print ("[Lua]: Miner "..miner:Name().." has got "..miner:GoldCarried().." nuggets")


  if miner:GoldCarried() > 4 then
  
  local int_to_dialog={"[Lua]: Miner "..miner:Name().." decides to go home, with his pockets full of nuggets",
                     "[Lua]: Miner "..miner:Name().." is headed back to the shack with loads a gold",
                     "[Lua]: Miner "..miner:Name().." is feeling rich enough to head on out"}

 miner:GetFSM():ChangeState(State_GoHome)

  end

end


State_GoToMine["Exit"] = function(miner)

   local int_to_dialog={"[Lua]: Miner "..miner:Name().." exits goldmine",
                     "[Lua]: Miner "..miner:Name().." leaving da goldmine",
                     "[Lua]: Miner "..miner:Name().." heading out this sweet goldmine of mine"}
  
 end




 