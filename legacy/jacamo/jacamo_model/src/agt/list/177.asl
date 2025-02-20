// beliefs and rules
kqml::bel_no_source_self(NS::Content,Ans) :- (NS::Content[|LA] & (kqml::clear_source_self(LA,NLA) & ((Content =.. [F,T,_709]) & (Ans =.. [NS,F,T,NLA])))).
kqml::clear_source_self([],[]).
kqml::clear_source_self([source(self)|T],NT) :- kqml::clear_source_self(T,NT).
kqml::clear_source_self([A|T],[A|NT]) :- ((A \== source(self)) & kqml::clear_source_self(T,NT)).
depot(7,5,27)[artifact_id(cobj_3),artifact_name(m2view),percept_type(obs_prop),source(percept),workspace("/main/mining",cobj_2)].
my_testing(0.8258877979030541).
pos(5,27)[artifact_id(cobj_3),artifact_name(m2view),percept_type(obs_prop),source(percept),workspace("/main/mining",cobj_2)].
score(1).
main.
gsize(7,35,35)[artifact_id(cobj_3),artifact_name(m2view),percept_type(obs_prop),source(percept),workspace("/main/mining",cobj_2)].
focused(WksName,ArtName[artifact_type(Type)],ArtId) :- focusing(ArtId,ArtName,Type,_667,WksName,_668).
joinedWsp(cobj_2,mining,"/main/mining")[artifact_id(cobj_1),artifact_name(session_177),percept_type(obs_prop),source(percept),workspace("/main",cobj_0)].
joinedWsp(cobj_0,main,"/main")[artifact_id(cobj_1),artifact_name(session_177),percept_type(obs_prop),source(percept),workspace("/main",cobj_0)].
joined(WksName,WksId) :- joinedWsp(WksId,WksName,_669).
last_dir(down).
focusing(cobj_3,m2view,"mining.MiningPlanet",cobj_2,mining,"/main/mining")[artifact_id(cobj_4),artifact_name(body_177),percept_type(obs_prop),source(percept),workspace("/main/mining",cobj_2)].


// initial goals
!start.
!say(hello).


// plans from jar:file:/home/gradle/.gradle/caches/modules-2/files-2.1/org.jacamo/jacamo/1.0/bda076187adb93bc05a91ab0cdcb2fb44b039ed6/jacamo-1.0.jar!/templates/common-cartago.asl

@p__169[source(self),url("jar:file:/home/gradle/.gradle/caches/modules-2/files-2.1/org.jacamo/jacamo/1.0/bda076187adb93bc05a91ab0cdcb2fb44b039ed6/jacamo-1.0.jar!/templates/common-cartago.asl")] +!jcm::focus_env_art([],_664).
@p__170[source(self),url("jar:file:/home/gradle/.gradle/caches/modules-2/files-2.1/org.jacamo/jacamo/1.0/bda076187adb93bc05a91ab0cdcb2fb44b039ed6/jacamo-1.0.jar!/templates/common-cartago.asl")] +!jcm::focus_env_art(L,0) <- .print("Error focusing on environment artifact ",L).
@lf_env_art[atomic,source(self),url("jar:file:/home/gradle/.gradle/caches/modules-2/files-2.1/org.jacamo/jacamo/1.0/bda076187adb93bc05a91ab0cdcb2fb44b039ed6/jacamo-1.0.jar!/templates/common-cartago.asl")] +!jcm::focus_env_art([H|T],Try) <- !jcm::focus_env_art(H,Try); !jcm::focus_env_art(T,Try).
@p__171[source(self),url("jar:file:/home/gradle/.gradle/caches/modules-2/files-2.1/org.jacamo/jacamo/1.0/bda076187adb93bc05a91ab0cdcb2fb44b039ed6/jacamo-1.0.jar!/templates/common-cartago.asl")] +!jcm::focus_env_art(art_env(W,"",_665),Try) <- .concat("/main/",W,FullW); joinWorkspace(FullW,_666); .print("joinned workspace ",FullW).
@p__172[source(self),url("jar:file:/home/gradle/.gradle/caches/modules-2/files-2.1/org.jacamo/jacamo/1.0/bda076187adb93bc05a91ab0cdcb2fb44b039ed6/jacamo-1.0.jar!/templates/common-cartago.asl")] +!jcm::focus_env_art(art_env(W,A,NS),Try) <- .concat("/main/",W,FullW); .print("focusing on artifact ",A," (at workspace ",FullW,") using namespace ",NS); joinWorkspace(FullW,WId); lookupArtifact(A,AId)[wid(WId)]; NS::focus(AId)[wid(WId)].
@p__173[source(self),url("jar:file:/home/gradle/.gradle/caches/modules-2/files-2.1/org.jacamo/jacamo/1.0/bda076187adb93bc05a91ab0cdcb2fb44b039ed6/jacamo-1.0.jar!/templates/common-cartago.asl")] -!jcm::focus_env_art(L,Try) <- .print("waiting a bit to focus on ",L," try #",Try); .wait(200); !jcm::focus_env_art(L,(Try-1)).


// plans from file:src/agt/default_agent.asl

@pfunction2[atomic,source(self),url("file:src/agt/default_agent.asl")] +main <- .print("Hello there. I'm a regular agent"); ?agent_id(AGENTID); ?path(PATH); .random(R); +my_testing(R); ?my_testing(R); .print("R: ",R); .abolish(agent_id(_670)); .abolish(path(_671)); ?sugar(SUGAR); ?metabolism(METABOLISM); ?vision(VISION); .print("Sugar ",SUGAR); .print("Metabolism ",METABOLISM); .print("Vision ",VISION); .abolish(sugar(_672)); .abolish(metabolism(_673)); .abolish(vision(_674)); .my_name(MYNAME); .concat("src/agt/list/",MYNAME,".asl",NAME); .save_agent(NAME,[start,say(hello)]); .print("Saved my information on file. Sending message to remove agent from simulation"); .send(killer_agent,tell,kill(AGENTID,PATH,MYNAME,SUGAR,METABOLISM,VISION)); .send(killer_agent,untell,kill(AGENTID,PATH,MYNAME,SUGAR,METABOLISM,VISION)).
@p__174[source(self),url("file:src/agt/default_agent.asl")] +free : (gsize(_675,W,H) & (jia.random(RX,(W-1)) & jia.random(RY,(H-1)))) <- .print("I am going to go near (",RX,",",RY,")"); !go_near(RX,RY).
@p__175[source(self),url("file:src/agt/default_agent.asl")] +free <- .wait(100); -+free.
@p__176[source(self),url("file:src/agt/default_agent.asl")] +near(X,Y) : free <- -+free.
@p__177[source(self),url("file:src/agt/default_agent.asl")] +!go_near(X,Y) : free <- -near(_676,_677); -last_dir(_678); !near(X,Y).
@p__178[source(self),url("file:src/agt/default_agent.asl")] +!near(X,Y) : (pos(AgX,AgY) & jia.neighbour(AgX,AgY,X,Y)) <- .print("I am at ","(",AgX,",",AgY,")"," which is near (",X,",",Y,")"); +near(X,Y).
@p__179[source(self),url("file:src/agt/default_agent.asl")] +!near(X,Y) : (pos(AgX,AgY) & last_dir(skip)) <- .print("I am at ","(",AgX,",",AgY,")"," and I can't get to' (",X,",",Y,")"); +near(X,Y).
@p__180[source(self),url("file:src/agt/default_agent.asl")] +!near(X,Y) : not (near(X,Y)) <- !next_step(X,Y); !near(X,Y).
@p__181[source(self),url("file:src/agt/default_agent.asl")] +!near(X,Y) <- !near(X,Y).
@p__182[source(self),url("file:src/agt/default_agent.asl")] +!next_step(X,Y) : pos(AgX,AgY) <- jia.get_direction(AgX,AgY,X,Y,D); -+last_dir(D); D.
@p__183[source(self),url("file:src/agt/default_agent.asl")] +!next_step(X,Y) : not (pos(_679,_680)) <- !next_step(X,Y).
@p__184[source(self),url("file:src/agt/default_agent.asl")] -!next_step(X,Y) <- -+last_dir(null); !next_step(X,Y).
@p__185[source(self),url("file:src/agt/default_agent.asl")] +!pos(X,Y) : pos(X,Y) <- .print("I've reached ",X,"x",Y).
@p__186[source(self),url("file:src/agt/default_agent.asl")] +!pos(X,Y) : not (pos(X,Y)) <- !next_step(X,Y); !pos(X,Y).
@p__187[source(self),url("file:src/agt/default_agent.asl")] +cell(X,Y,gold) <- +gold(X,Y).
@pcell[atomic,source(self),url("file:src/agt/default_agent.asl")] +gold(X,Y) : (not (carrying_gold) & free) <- -free; .print("Gold perceived: ",gold(X,Y)); !init_handle(gold(X,Y)).
@pcell2[atomic,source(self),url("file:src/agt/default_agent.asl")] +gold(X,Y) : (not (carrying_gold) & (not (free) & (.desire(handle(gold(OldX,OldY))) & (pos(AgX,AgY) & (jia.dist(X,Y,AgX,AgY,DNewG) & (jia.dist(OldX,OldY,AgX,AgY,DOldG) & (DNewG < DOldG))))))) <- .drop_desire(handle(gold(OldX,OldY))); .print("Giving up current gold ",gold(OldX,OldY)," to handle ",gold(X,Y)," which I am seeing!"); !init_handle(gold(X,Y)).
@pih1[atomic,source(self),url("file:src/agt/default_agent.asl")] +!init_handle(Gold) : .desire(near(_681,_682)) <- .print("Dropping near(_,_) desires and intentions to handle ",Gold); .drop_desire(near(_683,_684)); !init_handle(Gold).
@pih2[atomic,source(self),url("file:src/agt/default_agent.asl")] +!init_handle(Gold) : pos(X,Y) <- .print("Going for ",Gold); !!handle(Gold).
@pfunction[atomic,source(self),url("file:src/agt/default_agent.asl")] +!handle(gold(X,Y)) : not (free) <- .print("Handling ",gold(X,Y)," now."); !pos(X,Y); !ensure(pick,gold(X,Y)); ?depot(_685,DX,DY); !pos(DX,DY); !ensure(drop,0); .print("Finish handling ",gold(X,Y)); ?score(S); -+score((S+1)); .send(leader,tell,dropped); +main.
@p__188[source(self),url("file:src/agt/default_agent.asl")] -!handle(G) : G <- .print("failed to catch gold ",G); .abolish(G); !!choose_gold.
@p__189[source(self),url("file:src/agt/default_agent.asl")] -!handle(G) <- .print("failed to handle ",G,", it isn't in the BB anyway"); !!choose_gold.
@p__190[source(self),url("file:src/agt/default_agent.asl")] +!ensure(pick,_686) : (pos(X,Y) & gold(X,Y)) <- pick; ?carrying_gold; -gold(X,Y).
@p__191[source(self),url("file:src/agt/default_agent.asl")] +!ensure(drop,_687) : (carrying_gold & (pos(X,Y) & depot(_688,X,Y))) <- drop.
@p__192[source(self),url("file:src/agt/default_agent.asl")] +winning(A,S)[source(leader)] : .my_name(A) <- -winning(A,S); .print("I am the greatest!!!").
@p__193[source(self),url("file:src/agt/default_agent.asl")] +winning(A,S)[source(leader)] <- -winning(A,S).
@p__194[source(self),url("file:src/agt/default_agent.asl")] +!choose_gold : not (gold(_689,_690)) <- -+free.
@p__195[source(self),url("file:src/agt/default_agent.asl")] +!choose_gold : gold(_691,_692) <- .findall(gold(X,Y),gold(X,Y),LG); !calc_gold_distance(LG,LD); .length(LD,LLD); (LLD > 0); .print("Gold distances: ",LD,LLD); .min(LD,d(_693,NewG)); .print("Next gold is ",NewG); !!handle(NewG).
@p__196[source(self),url("file:src/agt/default_agent.asl")] -!choose_gold <- -+free.
@p__197[source(self),url("file:src/agt/default_agent.asl")] +!calc_gold_distance([],[]).
@p__198[source(self),url("file:src/agt/default_agent.asl")] +!calc_gold_distance([gold(GX,GY)|R],[d(D,gold(GX,GY))|RD]) : pos(IX,IY) <- jia.dist(IX,IY,GX,GY,D); !calc_gold_distance(R,RD).
@p__199[source(self),url("file:src/agt/default_agent.asl")] +!calc_gold_distance([_694|R],RD) <- !calc_gold_distance(R,RD).
@p__200[source(self),url("file:src/agt/default_agent.asl")] +end_of_simulation(S,_695) <- .drop_all_desires; .abolish(gold(_696,_697)); .abolish(picked(_698)); -+free; .print("-- END ",S," --").

