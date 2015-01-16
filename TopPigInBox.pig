data_line = load '$input' using PigStorage('[') as (ignore1, ignore2, name_line:chararray);
data = foreach data_line generate REPLACE(name_line, '].*$', '') as name_list;
data = foreach data generate FLATTEN(STRSPLITTOBAG(name_list, ', *', 20)) as name;
result = group data by name;
result = foreach result generate COUNT(data) as count, group;
result = order result by count desc;
result = foreach result generate group;
result = LIMIT result 101;
store result into '$output';
