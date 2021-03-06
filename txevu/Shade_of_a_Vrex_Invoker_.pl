# Shade_of_a_Vrex_Invoker_ (297214) on grid 72

sub EVENT_WAYPOINT_ARRIVE {
	if($wp == 17) {
		quest::signalwith(297212,1); #tell trigger I'm here
		quest::modifynpcstat("special_attacks","SMCID"); #go active
	}
}

sub EVENT_CAST {
	quest::settimer("check_charm",1);
}

sub EVENT_TIMER {
	if($npc->GetPetID()) {
		quest::stoptimer("check_charm");
		$npc->RemoveAISpell(891);
	}
}


sub EVENT_SIGNAL {
	if($signal == 3) { #my turn to be absorbed
		quest::say("High Priest, may my everlasting soul provide you with the strength to cleanse this temple!");
		quest::emote("dissolves into tendrils of ghostly vapor that reach out and replenish the strength of High Priest Nkosi Bakari.");
		quest::depop();
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::spawn2(297214,0,0,$x,$y,$z,$h); # NPC: Shade_of_a_Vrex_Invoker_
}

sub EVENT_SPAWN {
	# this is if I repopped myself during HP fight
	if ($y > 0) {
		quest::modifynpcstat("special_attacks","SMCID"); #go active
	}
}