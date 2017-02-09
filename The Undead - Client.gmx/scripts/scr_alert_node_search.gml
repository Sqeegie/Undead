//create a temp list and add alert nodes within vision to it...

var alertNodesInVision;
alertNodesInVision = ds_list_create();

with (obj_alert_node) {
    if (id != other.alertedLastNode) {
        if collision_circle(other.x, other.y, other.veiwDistance, id, false, false) {
            if (!collision_line(x, y, other.x, other.y, obj_par_solid, true, false)) {
                if (ds_list_find_index(other.alertedVisitedNodeList, id) =- 1) { ds_list_add(alertNodesInVision, id); }
            }
        }
    }
}

//If list is not empty, randomise it and select the first node...
if (!ds_list_empty(alertNodesInVision)) {
    ds_list_shuffle(alertNodesInVision);
    //DEBUG START---------------Can be deleted
    var i;
    for (i = 0; i < ds_list_size(alertNodesInVision); i++) {
        with (ds_list_find_value(alertNodesInVision, i)) {
            visible = true;
            alarm[0] = room_speed;
        }
    }
    //DEBUG END------------------------------
    targetedNode = ds_list_find_value(alertNodesInVision, 0);
    ds_list_add(alertedVisitedNodeList, targetedNode);
    ds_list_destroy(alertNodesInVision);
    scr_path_create(targetedNode.x, targetedNode.y);
}
else {
    //If list is empty go back to patrol state...
    ds_list_destroy(alertNodesInVision);
    
    //show_message("list empty"); //debug... Can be deleted
    
    intrestLevel = 1;
    alertedTimer = 6;
    if (variable_local_exists("p_num")) { // TODO: Fix this
        scr_path_create(p[p_num, 0], p[p_num, 1]);
    }
    else {
        ds_list_clear(alertedVisitedNodeList);
        targetedNode = noone;
        alertedTimer = 1;
        intrestLevel = 0;
    }
}
