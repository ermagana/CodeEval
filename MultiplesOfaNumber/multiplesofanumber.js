/*Sample code to read in test cases:*/
var fs  = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line !== "") {
        var nums = line.split(','),
            x = parseInt(nums[0], 10),
            n = parseInt(nums[1], 10),
            a = n,
            i = 2;
        while(a < x){
            a += n;
        }
        console.log(a);
    }
});