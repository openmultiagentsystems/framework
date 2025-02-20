// beliefs and rules
kqml::bel_no_source_self(NS::Content,Ans) :- (NS::Content[|LA] & (kqml::clear_source_self(LA,NLA) & ((Content =.. [F,T,_730]) & (Ans =.. [NS,F,T,NLA])))).
kqml::clear_source_self([],[]).
kqml::clear_source_self([source(self)|T],NT) :- kqml::clear_source_self(T,NT).
kqml::clear_source_self([A|T],[A|NT]) :- ((A \== source(self)) & kqml::clear_source_self(T,NT)).
depot(7,5,27)[artifact_id(cobj_3),artifact_name(m2view),percept_type(obs_prop),source(percept),workspace("/main/mining",cobj_2)].
my_testing(0.058137404613505694).
pos(5,27)[artifact_id(cobj_3),artifact_name(m2view),percept_type(obs_prop),source(percept),workspace("/main/mining",cobj_2)].
score(1).
main.
gsize(7,35,35)[artifact_id(cobj_3),artifact_name(m2view),percept_type(obs_prop),source(percept),workspace("/main/mining",cobj_2)].
focused(WksName,ArtName[artifact_type(Type)],ArtId) :- focusing(ArtId,ArtName,Type,_688,WksName,_689).
joinedWsp(cobj_2,mining,"/main/mining")[artifact_id(cobj_1),artifact_name(session_278),percept_type(obs_prop),source(percept),workspace("/main",cobj_0)].
joinedWsp(cobj_0,main,"/main")[artifact_id(cobj_1),artifact_name(session_278),percept_type(obs_prop),source(percept),workspace("/main",cobj_0)].
joined(WksName,WksId) :- joinedWsp(WksId,WksName,_690).
last_dir(down).
focusing(cobj_3,m2view,"mining.MiningPlanet",cobj_2,mining,"/main/mining")[artifact_id(cobj_4),artifact_name(body_278),percept_type(obs_prop),source(percept),workspace("/main/mining",cobj_2)].


// initial goals
!start.
!say(hello).


// plans from jar:file:/home/gradle/.gradle/caches/modules-2/files-2.1/org.jacamo/jacamo/1.0/bda076187adb93bc05a91ab0cdcb2fb44b039ed6/jacamo-1.0.jar!/templates/common-cartago.asl

@p__137[source(self),url("jar:file:/home/gradle/.gradle/caches/modules-2/files-2.1/org.jacamo/jacamo/1.0/bda076187adb93bc05a91ab0cdcb2fb44b039ed6/jacamo-1.0.jar!/templates/common-cartago.asl")] +!jcm::focus_env_art([],_685).
@p__138[source(self),url("jar:file:/home/gradle/.gradle/caches/modules-2/files-2.1/org.jacamo/jacamo/1.0/bda076187adb93bc05a91ab0cdcb2fb44b039ed6/jacamo-1.0.jar!/templates/common-cartago.asl")] +!jcm::focus_env_art(L,0) <- .print("Error focusing on environment artifact ",L).
@lf_env_art[atomic,source(self),url("jar:file:/home/gradle/.gradle/caches/modules-2/files-2.1/org.jacamo/jacamo/1.0/bda076187adb93bc05a91ab0cdcb2fb44b039ed6/jacamo-1.0.jar!/templates/common-cartago.asl")] +!jcm::focus_env_art([H|T],Try) <- !jcm::focus_env_art(H,Try); !jcm::focus_env_art(T,Try).
@p__139[source(self),url("jar:file:/home/gradle/.gradle/caches/modules-2/files-2.1/org.jacamo/jacamo/1.0/bda076187adb93bc05a91ab0cdcb2fb44b039ed6/jacamo-1.0.jar!/templates/common-cartago.asl")] +!jcm::focus_env_art(art_env(W,"",_686),Try) <- .concat("/main/",W,FullW); joinWorkspace(FullW,_687); .print("joinned workspace ",FullW).
@p__140[source(self),url("jar:file:/home/gradle/.gradle/caches/modules-2/files-2.1/org.jacamo/jacamo/1.0/bda076187adb93bc05a91ab0cdcb2fb44b039ed6/jacamo-1.0.jar!/templates/common-cartago.asl")] +!jcm::focus_env_art(art_env(W,A,NS),Try) <- .concat("/main/",W,FullW); .print("focusing on artifact ",A," (at workspace ",FullW,") using namespace ",NS); joinWorkspace(FullW,WId); lookupArtifact(A,AId)[wid(WId)]; NS::focus(AId)[wid(WId)].
@p__141[source(self),url("jar:file:/home/gradle/.gradle/caches/modules-2/files-2.1/org.jacamo/jacamo/1.0/bda076187adb93bc05a91ab0cdcb2fb44b039ed6/jacamo-1.0.jar!/templates/common-cartago.asl")] -!jcm::focus_env_art(L,Try) <- .print("waiting a bit to focus on ",L," try #",Try); .wait(200); !jcm::focus_env_art(L,(Try-1)).


// plans from file:src/agt/default_agent.asl

@pfunction2[atomic,source(self),url("file:src/agt/default_agent.asl")] +main <- .print("Hello there. I'm a regular agent"); ?agent_id(AGENTID); ?path(PATH); .random(R); +my_testing(R); ?my_testing(R); .print("R: ",R); .abolish(agent_id(_691)); .abolish(path(_692)); ?sugar(SUGAR); ?metabolism(METABOLISM); ?vision(VISION); .print("Sugar ",SUGAR); .print("Metabolism ",METABOLISM); .print("Vision ",VISION); .abolish(sugar(_693)); .abolish(metabolism(_694)); .abolish(vision(_695)); .my_name(MYNAME); .concat("src/agt/list/",MYNAME,".asl",NAME); .save_agent(NAME,[start,say(hello)]); .print("Saved my information on file. Sending message to remove agent from simulation"); .send(killer_agent,tell,kill(AGENTID,PATH,MYNAME,SUGAR,METABOLISM,VISION)); .send(killer_agent,untell,kill(AGENTID,PATH,MYNAME,SUGAR,METABOLISM,VISION)).
@p__142[source(self),url("file:src/agt/default_agent.asl")] +free : (gsize(_696,W,H) & (jia.random(RX,(W-1)) & jia.random(RY,(H-1)))) <- .print("I am going to go near (",RX,",",RY,")"); !go_near(RX,RY).
@p__143[source(self),url("file:src/agt/default_agent.asl")] +free <- .wait(100); -+free.
@p__144[source(self),url("file:src/agt/default_agent.asl")] +near(X,Y) : free <- -+free.
@p__145[source(self),url("file:src/agt/default_agent.asl")] +!go_near(X,Y) : free <- -near(_697,_698); -last_dir(_699); !near(X,Y).
@p__146[source(self),url("file:src/agt/default_agent.asl")] +!near(X,Y) : (pos(AgX,AgY) & jia.neighbour(AgX,AgY,X,Y)) <- .print("I am at ","(",AgX,",",AgY,")"," which is near (",X,",",Y,")"); +near(X,Y).
@p__147[source(self),url("file:src/agt/default_agent.asl")] +!near(X,Y) : (pos(AgX,AgY) & last_dir(skip)) <- .print("I am at ","(",AgX,",",AgY,")"," and I can't get to' (",X,",",Y,")"); +near(X,Y).
@p__148[source(self),url("file:src/agt/default_agent.asl")] +!near(X,Y) : not (near(X,Y)) <- !next_step(X,Y); !near(X,Y).
@p__149[source(self),url("file:src/agt/default_agent.asl")] +!near(X,Y) <- !near(X,Y).
@p__150[source(self),url("file:src/agt/default_agent.asl")] +!next_step(X,Y) : pos(AgX,AgY) <- jia.get_direction(AgX,AgY,X,Y,D); -+last_dir(D); D.
@p__151[source(self),url("file:src/agt/default_agent.asl")] +!next_step(X,Y) : not (pos(_700,_701)) <- !next_step(X,Y).
@p__152[source(self),url("file:src/agt/default_agent.asl")] -!next_step(X,Y) <- -+last_dir(null); !next_step(X,Y).
@p__153[source(self),url("file:src/agt/default_agent.asl")] +!pos(X,Y) : pos(X,Y) <- .print("I've reached ",X,"x",Y).
@p__154[source(self),url("file:src/agt/default_agent.asl")] +!pos(X,Y) : not (pos(X,Y)) <- !next_step(X,Y); !pos(X,Y).
@p__155[source(self),url("file:src/agt/default_agent.asl")] +cell(X,Y,gold) <- +gold(X,Y).
@pcell[atomic,source(self),url("file:src/agt/default_agent.asl")] +gold(X,Y) : (not (carrying_gold) & free) <- -free; .print("Gold perceived: ",gold(X,Y)); !init_handle(gold(X,Y)).
@pcell2[atomic,source(self),url("file:src/agt/default_agent.asl")] +gold(X,Y) : (not (carrying_gold) & (not (free) & (.desire(handle(gold(OldX,OldY))) & (pos(AgX,AgY) & (jia.dist(X,Y,AgX,AgY,DNewG) & (jia.dist(OldX,OldY,AgX,AgY,DOldG) & (DNewG < DOldG))))))) <- .drop_desire(handle(gold(OldX,OldY))); .print("Giving up current gold ",gold(OldX,OldY)," to handle ",gold(X,Y)," which I am seeing!"); !init_handle(gold(X,Y)).
@pih1[atomic,source(self),url("file:src/agt/default_agent.asl")] +!init_handle(Gold) : .desire(near(_702,_703)) <- .print("Dropping near(_,_) desires and intentions to handle ",Gold); .drop_desire(near(_704,_705)); !init_handle(Gold).
@pih2[atomic,source(self),url("file:src/agt/default_agent.asl")] +!init_handle(Gold) : pos(X,Y) <- .print("Going for ",Gold); !!handle(Gold).
@pfunction[atomic,source(self),url("file:src/agt/default_agent.asl")] +!handle(gold(X,Y)) : not (free) <- .print("Handling ",gold(X,Y)," now."); !pos(X,Y); !ensure(pick,gold(X,Y)); ?depot(_706,DX,DY); !pos(DX,DY); !ensure(drop,0); .print("Finish handling ",gold(X,Y)); ?score(S); -+score((S+1)); .send(leader,tell,dropped); +main.
@p__156[source(self),url("file:src/agt/default_agent.asl")] -!handle(G) : G <- .print("failed to catch gold ",G); .abolish(G); !!choose_gold.
@p__157[source(self),url("file:src/agt/default_agent.asl")] -!handle(G) <- .print("failed to handle ",G,", it isn't in the BB anyway"); !!choose_gold.
@p__158[source(self),url("file:src/agt/default_agent.asl")] +!ensure(pick,_707) : (pos(X,Y) & gold(X,Y)) <- pick; ?carrying_gold; -gold(X,Y).
@p__159[source(self),url("file:src/agt/default_agent.asl")] +!ensure(drop,_708) : (carrying_gold & (pos(X,Y) & depot(_709,X,Y))) <- drop.
@p__160[source(self),url("file:src/agt/default_agent.asl")] +winning(A,S)[source(leader)] : .my_name(A) <- -winning(A,S); .print("I am the greatest!!!").
@p__161[source(self),url("file:src/agt/default_agent.asl")] +winning(A,S)[source(leader)] <- -winning(A,S).
@p__162[source(self),url("file:src/agt/default_agent.asl")] +!choose_gold : not (gold(_710,_711)) <- -+free.
@p__163[source(self),url("file:src/agt/default_agent.asl")] +!choose_gold : gold(_712,_713) <- .findall(gold(X,Y),gold(X,Y),LG); !calc_gold_distance(LG,LD); .length(LD,LLD); (LLD > 0); .print("Gold distances: ",LD,LLD); .min(LD,d(_714,NewG)); .print("Next gold is ",NewG); !!handle(NewG).
@p__164[source(self),url("file:src/agt/default_agent.asl")] -!choose_gold <- -+free.
@p__165[source(self),url("file:src/agt/default_agent.asl")] +!calc_gold_distance([],[]).
@p__166[source(self),url("file:src/agt/default_agent.asl")] +!calc_gold_distance([gold(GX,GY)|R],[d(D,gold(GX,GY))|RD]) : pos(IX,IY) <- jia.dist(IX,IY,GX,GY,D); !calc_gold_distance(R,RD).
@p__167[source(self),url("file:src/agt/default_agent.asl")] +!calc_gold_distance([_715|R],RD) <- !calc_gold_distance(R,RD).
@p__168[source(self),url("file:src/agt/default_agent.asl")] +end_of_simulation(S,_716) <- .drop_all_desires; .abolish(gold(_717,_718)); .abolish(picked(_719)); -+free; .print("-- END ",S," --").

