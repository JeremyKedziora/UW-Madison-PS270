#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#An example of computing the margin of error
#Jeremy Kedziora
#12/12/2022
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
would_vote_biden = 570
n_voters = 1118

v_S = would_vote_biden/n_voters
MOE = 1.96*sqrt((v_S*(1 - v_S))/n_voters)

