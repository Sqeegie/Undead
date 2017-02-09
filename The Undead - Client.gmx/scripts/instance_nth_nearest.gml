/// instance_nth_nearest(x,y,obj,n)
//
//  Returns the id of the nth nearest instance of an object
//  to a given point or noone if none is found.
//
//      x,y       point coordinates, real
//      obj       object index (or all), real
//      n         proximity, real
//
{
    var pointx, pointy, object, n, list, nearest;
    pointx = argument[0];
    pointy = argument[1];
    object = argument[2];
    n = argument[3];
    n = min(max(1, n), instance_number(object));
    list = ds_priority_create();
    nearest = noone;
    with (object) { ds_priority_add(list, id, distance_to_point(pointx, pointy)); }
    repeat (n) { nearest = ds_priority_delete_min(list); }
    ds_priority_destroy(list);
    return nearest;
}
