function square(x){ return x * x; }

function sum_squares(x, y){
    return square(x) + square(y);
}

function top_2(x, y, z){
    var arr = [x,y,z].sort();
    return Array(arr[2], arr[1]);
}

function top_2_squared(x, y, z){
    var arr = [x,y,z].sort();
    return sum_squares(arr[1], arr[2]);
}

