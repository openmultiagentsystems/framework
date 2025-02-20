// beliefs and rules
kqml::bel_no_source_self(NS::Content,Ans) :- (NS::Content[|LA] & (kqml::clear_source_self(LA,NLA) & ((Content =.. [F,T,_2177]) & (Ans =.. [NS,F,T,NLA])))).
kqml::clear_source_self([],[]).
kqml::clear_source_self([source(self)|T],NT) :- kqml::clear_source_self(T,NT).
kqml::clear_source_self([A|T],[A|NT]) :- ((A \== source(self)) & kqml::clear_source_self(T,NT)).
depot(7,5,27)[artifact_id(cobj_3),artifact_name(m2view),percept_type(obs_prop),source(percept),workspace("/main/mining",cobj_2)].
my_testing(0.7628347165638422).
pos(5,27)[artifact_id(cobj_3),artifact_name(m2view),percept_type(obs_prop),source(percept),workspace("/main/mining",cobj_2)].
score(1).
main.
gsize(7,35,35)[artifact_id(cobj_3),artifact_name(m2view),percept_type(obs_prop),source(percept),workspace("/main/mining",cobj_2)].
focused(WksName,ArtName[artifact_type(Type)],ArtId) :- focusing(ArtId,ArtName,Type,_2135,WksName,_2136).
joinedWsp(cobj_2,mining,"/main/mining")[artifact_id(cobj_1),artifact_name(session_557),percept_type(obs_prop),source(percept),workspace("/main",cobj_0)].
joinedWsp(cobj_0,main,"/main")[artifact_id(cobj_1),artifact_name(session_557),percept_type(obs_prop),source(percept),workspace("/main",cobj_0)].
joined(WksName,WksId) :- joinedWsp(WksId,WksName,_2137).
last_dir(down).
focusing(cobj_3,m2view,"mining.MiningPlanet",cobj_2,mining,"/main/mining")[artifact_id(cobj_4),artifact_name(body_557),percept_type(obs_prop),source(percept),workspace("/main/mining",cobj_2)].


// initial goals
!start.
!say(hello).


// plans from jar:file:/home/gradle/.gradle/caches/modules-2/files-2.1/org.jacamo/jacamo/1.0/bda076187adb93bc05a91ab0cdcb2fb44b039ed6/jacamo-1.0.jar!/templates/common-cartago.asl

@p__361[source(self),url("jar:file:/home/gradle/.gradle/caches/modules-2/files-2.1/org.jacamo/jacamo/1.0/bda076187adb93bc05a91ab0cdcb2fb44b039ed6/jacamo-1.0.jar!/templates/common-cartago.asl")] +!jcm::focus_env_art([],_2132).
@p__362[source(self),url("jar:file:/home/gradle/.gradle/caches/modules-2/files-2.1/org.jacamo/jacamo/1.0/bda076187adb93bc05a91ab0cdcb2fb44b039ed6/jacamo-1.0.jar!/templates/common-cartago.asl")] +!jcm::focus_env_art(L,0) <- .print("Error focusing on environment artifact ",L).
@lf_env_art[atomic,source(self),url("jar:file:/home/gradle/.gradle/caches/modules-2/files-2.1/org.jacamo/jacamo/1.0/bda076187adb93bc05a91ab0cdcb2fb44b039ed6/jacamo-1.0.jar!/templates/common-cartago.asl")] +!jcm::focus_env_art([H|T],Try) <- !jcm::focus_env_art(H,Try); !jcm::focus_env_art(T,Try).
@p__363[source(self),url("jar:file:/home/gradle/.gradle/caches/modules-2/files-2.1/org.jacamo/jacamo/1.0/bda076187adb93bc05a91ab0cdcb2fb44b039ed6/jacamo-1.0.jar!/templates/common-cartago.asl")] +!jcm::focus_env_art(art_env(W,"",_2133),Try) <- .concat("/main/",W,FullW); joinWorkspace(FullW,_2134); .print("joinned workspace ",FullW).
@p__364[source(self),url("jar:file:/home/gradle/.gradle/caches/modules-2/files-2.1/org.jacamo/jacamo/1.0/bda076187adb93bc05a91ab0cdcb2fb44b039ed6/jacamo-1.0.jar!/templates/common-cartago.asl")] +!jcm::focus_env_art(art_env(W,A,NS),Try) <- .concat("/main/",W,FullW); .print("focusing on artifact ",A," (at workspace ",FullW,") using namespace ",NS); joinWorkspace(FullW,WId); lookupArtifact(A,AId)[wid(WId)]; NS::focus(AId)[wid(WId)].
@p__365[source(self),url("jar:file:/home/gradle/.gradle/caches/modules-2/files-2.1/org.jacamo/jacamo/1.0/bda076187adb93bc05a91ab0cdcb2fb44b039ed6/jacamo-1.0.jar!/templates/common-cartago.asl")] -!jcm::focus_env_art(L,Try) <- .print("waiting a bit to focus on ",L," try #",Try); .wait(200); !jcm::focus_env_art(L,(Try-1)).


// plans from file:src/agt/default_agent.asl

@pfunction2[atomic,source(self),url("file:src/agt/default_agent.asl")] +main <- .print("Hello there. I'm a regular agent"); ?agent_id(AGENTID); ?path(PATH); .random(R); +my_testing(R); ?my_testing(R); .print("R: ",R); .abolish(agent_id(_2138)); .abolish(path(_2139)); ?sugar(SUGAR); ?metabolism(METABOLISM); ?vision(VISION); .print("Sugar ",SUGAR); .print("Metabolism ",METABOLISM); .print("Vision ",VISION); .abolish(sugar(_2140)); .abolish(metabolism(_2141)); .abolish(vision(_2142)); .my_name(MYNAME); .concat("src/agt/list/",MYNAME,".asl",NAME); .save_agent(NAME,[start,say(hello)]); .print("Saved my information on file. Sending message to remove agent from simulation"); .send(killer_agent,tell,kill(AGENTID,PATH,MYNAME,SUGAR,METABOLISM,VISION)); .send(killer_agent,untell,kill(AGENTID,PATH,MYNAME,SUGAR,METABOLISM,VISION)).
@p__366[source(self),url("file:src/agt/default_agent.asl")] +free : (gsize(_2143,W,H) & (jia.random(RX,(W-1)) & jia.random(RY,(H-1)))) <- .print("I am going to go near (",RX,",",RY,")"); !go_near(RX,RY).
@p__367[source(self),url("file:src/agt/default_agent.asl")] +free <- .wait(100); -+free.
@p__368[source(self),url("file:src/agt/default_agent.asl")] +near(X,Y) : free <- -+free.
@p__369[source(self),url("file:src/agt/default_agent.asl")] +!go_near(X,Y) : free <- -near(_2144,_2145); -last_dir(_2146); !near(X,Y).
@p__370[source(self),url("file:src/agt/default_agent.asl")] +!near(X,Y) : (pos(AgX,AgY) & jia.neighbour(AgX,AgY,X,Y)) <- .print("I am at ","(",AgX,",",AgY,")"," which is near (",X,",",Y,")"); +near(X,Y).
@p__371[source(self),url("file:src/agt/default_agent.asl")] +!near(X,Y) : (pos(AgX,AgY) & last_dir(skip)) <- .print("I am at ","(",AgX,",",AgY,")"," and I can't get to' (",X,",",Y,")"); +near(X,Y).
@p__372[source(self),url("file:src/agt/default_agent.asl")] +!near(X,Y) : not (near(X,Y)) <- !next_step(X,Y); !near(X,Y).
@p__373[source(self),url("file:src/agt/default_agent.asl")] +!near(X,Y) <- !near(X,Y).
@p__374[source(self),url("file:src/agt/default_agent.asl")] +!next_step(X,Y) : pos(AgX,AgY) <- jia.get_direction(AgX,AgY,X,Y,D); -+last_dir(D); D.
@p__375[source(self),url("file:src/agt/default_agent.asl")] +!next_step(X,Y) : not (pos(_2147,_2148)) <- !next_step(X,Y).
@p__376[source(self),url("file:src/agt/default_agent.asl")] -!next_step(X,Y) <- -+last_dir(null); !next_step(X,Y).
@p__377[source(self),url("file:src/agt/default_agent.asl")] +!pos(X,Y) : pos(X,Y) <- .print("I've reached ",X,"x",Y).
@p__378[source(self),url("file:src/agt/default_agent.asl")] +!pos(X,Y) : not (pos(X,Y)) <- !next_step(X,Y); !pos(X,Y).
@p__379[source(self),url("file:src/agt/default_agent.asl")] +cell(X,Y,gold) <- +gold(X,Y).
@pcell[atomic,source(self),url("file:src/agt/default_agent.asl")] +gold(X,Y) : (not (carrying_gold) & free) <- -free; .print("Gold perceived: ",gold(X,Y)); !init_handle(gold(X,Y)).
@pcell2[atomic,source(self),url("file:src/agt/default_agent.asl")] +gold(X,Y) : (not (carrying_gold) & (not (free) & (.desire(handle(gold(OldX,OldY))) & (pos(AgX,AgY) & (jia.dist(X,Y,AgX,AgY,DNewG) & (jia.dist(OldX,OldY,AgX,AgY,DOldG) & (DNewG < DOldG))))))) <- .drop_desire(handle(gold(OldX,OldY))); .print("Giving up current gold ",gold(OldX,OldY)," to handle ",gold(X,Y)," which I am seeing!"); !init_handle(gold(X,Y)).
@pih1[atomic,source(self),url("file:src/agt/default_agent.asl")] +!init_handle(Gold) : .desire(near(_2149,_2150)) <- .print("Dropping near(_,_) desires and intentions to handle ",Gold); .drop_desire(near(_2151,_2152)); !init_handle(Gold).
@pih2[atomic,source(self),url("file:src/agt/default_agent.asl")] +!init_handle(Gold) : pos(X,Y) <- .print("Going for ",Gold); !!handle(Gold).
@pfunction[atomic,source(self),url("file:src/agt/default_agent.asl")] +!handle(gold(X,Y)) : not (free) <- .print("Handling ",gold(X,Y)," now."); !pos(X,Y); !ensure(pick,gold(X,Y)); ?depot(_2153,DX,DY); !pos(DX,DY); !ensure(drop,0); .print("Finish handling ",gold(X,Y)); ?score(S); -+score((S+1)); .send(leader,tell,dropped); +main.
@p__380[source(self),url("file:src/agt/default_agent.asl")] -!handle(G) : G <- .print("failed to catch gold ",G); .abolish(G); !!choose_gold.
@p__381[source(self),url("file:src/agt/default_agent.asl")] -!handle(G) <- .print("failed to handle ",G,", it isn't in the BB anyway"); !!choose_gold.
@p__382[source(self),url("file:src/agt/default_agent.asl")] +!ensure(pick,_2154) : (pos(X,Y) & gold(X,Y)) <- pick; ?carrying_gold; -gold(X,Y).
@p__383[source(self),url("file:src/agt/default_agent.asl")] +!ensure(drop,_2155) : (carrying_gold & (pos(X,Y) & depot(_2156,X,Y))) <- drop.
@p__384[source(self),url("file:src/agt/default_agent.asl")] +winning(A,S)[source(leader)] : .my_name(A) <- -winning(A,S); .print("I am the greatest!!!").
@p__385[source(self),url("file:src/agt/default_agent.asl")] +winning(A,S)[source(leader)] <- -winning(A,S).
@p__386[source(self),url("file:src/agt/default_agent.asl")] +!choose_gold : not (gold(_2157,_2158)) <- -+free.
@p__387[source(self),url("file:src/agt/default_agent.asl")] +!choose_gold : gold(_2159,_2160) <- .findall(gold(X,Y),gold(X,Y),LG); !calc_gold_distance(LG,LD); .length(LD,LLD); (LLD > 0); .print("Gold distances: ",LD,LLD); .min(LD,d(_2161,NewG)); .print("Next gold is ",NewG); !!handle(NewG).
@p__388[source(self),url("file:src/agt/default_agent.asl")] -!choose_gold <- -+free.
@p__389[source(self),url("file:src/agt/default_agent.asl")] +!calc_gold_distance([],[]).
@p__390[source(self),url("file:src/agt/default_agent.asl")] +!calc_gold_distance([gold(GX,GY)|R],[d(D,gold(GX,GY))|RD]) : pos(IX,IY) <- jia.dist(IX,IY,GX,GY,D); !calc_gold_distance(R,RD).
@p__391[source(self),url("file:src/agt/default_agent.asl")] +!calc_gold_distance([_2162|R],RD) <- !calc_gold_distance(R,RD).
@p__392[source(self),url("file:src/agt/default_agent.asl")] +end_of_simulation(S,_2163) <- .drop_all_desires; .abolish(gold(_2164,_2165)); .abolish(picked(_2166)); -+free; .print("-- END ",S," --").

