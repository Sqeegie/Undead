/// collision_circle_list(x1, y1, radius, obj, prec, notme)
//
//  Returns a list data structure populated with the ids of instances 
//  colliding with a given circle, or noone if no instances found.
//
//      x1,y1       center of the collision circle (filled), real
//      radius      radius of the collision circle (filled), real
//      obj         object to check for collision (or all), real
//      prec        true for precise collision checking, bool
//      notme       true to ignore the calling instance, bool
//
{
    var x1, y1, radius, obj,prec,notme,dsid,i;
    x1 = argument[0];
    y1 = argument[1];
    radius = argument[2];
    obj = argument[3];
    prec = argument[4];
    notme = argument[5];
    dsid = ds_list_create();
    with (obj) {
        if (!notme || id != other.id) {
            i = collision_circle(x1, y1, radius, id, prec, false);
            if (i != noone) { ds_list_add(dsid, i); }
        }
    }
    if (ds_list_empty(dsid)) {
        ds_list_destroy(dsid);
        dsid = noone;
    }
    return dsid;
}
