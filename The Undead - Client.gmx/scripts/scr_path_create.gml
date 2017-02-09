//This creates the path for the AI and culls points to make it more natural...
//argument0=x coord
//argument1=y coord

//This rounds the points when not alerted to keep the AI within the grid

xCoord = argument[0];
yCoord = argument[1];

if (intrestLevel != 2) {
    if (variable_local_exists("p_num")) { // TODO: Fix this
        xCoord = floor(xCoord / 32) * 32 + 16;
        yCoord = floor(yCoord /32) * 32 + 16;
    }
}

path_end();

//Check and see if path exists
if (!mp_grid_path(global.AI_grid, myPath, x, y, xCoord, yCoord, true)) {
    // If no path found go to No Path Move (state 0) for a time...
    intrestLevel = 0;
    alarm[0] = room_speed * 3; // TODO: This needs to be adjusted for room speed?
    pathLength = 0;
    np_dir = choose(-10,10); // TODO : Create a variable for this
}
else {
    // If path is valid, create it, and cull unnecessary points...
    mp_grid_path(global.AI_grid, myPath, x, y, xCoord, yCoord, true);
    path_set_kind(myPath, 1);
    path_set_precision(myPath, 8);
    var n, x1, y1, x2, y2, x3, y3;
    if (path_get_number(myPath) > 2) {
        for (n = 1; n < path_get_number(myPath); n++) {
            x1 = path_get_point_x(myPath, n - 1);
            y1 = path_get_point_y(myPath, n-1);
            x2 = path_get_point_x(myPath, n);
            y2 = path_get_point_y(myPath, n);
            x3 = path_get_point_x(myPath, n+1);
            y3 = path_get_point_y(myPath, n+1);
            if ((x2 - x1) * (y3 - y2) == (x3 - x2) * (y2 - y1)) {
                path_delete_point(myPath, n);
                n--;
            }
        }
    }
    //get length of the path and number of points on the path
    //then set the moving x/y coords for mp_potential step
    //to the first point (or the end of the path if there are no points).
    pathLength = path_get_number(myPath);
    if (pathLength <= 1) {
        xx = xCoord;
        yy = yCoord;
    }
    else {
        currentPathPoint = 0;
        xx = path_get_point_x(myPath, currentPathPoint);
        yy = path_get_point_y(myPath, currentPathPoint);
    }
}
