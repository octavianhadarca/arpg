function __InputConfigVerbs()
{
    enum INPUT_VERB
    {
        //Add your own verbs here!
        SKILL_1,
        SKILL_2,
        SKILL_3,
        SKILL_4,
        SKILL_5,
        SKILL_6,
        UP,
        DOWN,
        LEFT,
        RIGHT
    }
    
    enum INPUT_CLUSTER
    {
        //Add your own clusters here!
        //Clusters are used for two-dimensional checkers (InputDirection() etc.)
        NAVIGATION,
    }
    
    InputDefineVerb(INPUT_VERB.UP,      "up",         [vk_up,    "W"],    [-gp_axislv, gp_padu]);
    InputDefineVerb(INPUT_VERB.DOWN,    "down",       [vk_down,  "S"],    [ gp_axislv, gp_padd]);
    InputDefineVerb(INPUT_VERB.LEFT,    "left",       [vk_left,  "A"],    [-gp_axislh, gp_padl]);
    InputDefineVerb(INPUT_VERB.RIGHT,   "right",      [vk_right, "D"],    [ gp_axislh, gp_padr]);
    InputDefineVerb(INPUT_VERB.SKILL_1,  "skill 1",      mb_left,            gp_shoulderl);
    InputDefineVerb(INPUT_VERB.SKILL_2, "skill 2", mb_right, gp_shoulderr);
    InputDefineVerb(INPUT_VERB.SKILL_3, "skill 3", "1", gp_face1);
    InputDefineVerb(INPUT_VERB.SKILL_4, "skill 4", "2", gp_face2);
    InputDefineVerb(INPUT_VERB.SKILL_5, "skill 5", "3", gp_face3);
    InputDefineVerb(INPUT_VERB.SKILL_6, "skill 6", "4", gp_face4);
    InputDefineCluster(INPUT_CLUSTER.NAVIGATION, INPUT_VERB.UP, INPUT_VERB.RIGHT, INPUT_VERB.DOWN, INPUT_VERB.LEFT);
    
    //Define a cluster of verbs for moving around
    InputDefineCluster(INPUT_CLUSTER.NAVIGATION, INPUT_VERB.UP, INPUT_VERB.RIGHT, INPUT_VERB.DOWN, INPUT_VERB.LEFT);
}
