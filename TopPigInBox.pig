data_line = load '$input' using PigStorage('[') as (ignore1, ignore2, name_line:chararray);
data = foreach data_line generate REPLACE(name_line, '].*$', '') as name_list;
data = foreach data generate FLATTEN(STRSPLITTOBAG(name_list, ',', 30)) as name;
result = group data by name;
result = foreach result generate COUNT(data) as count, group;
result = order result by count desc;
result = LIMIT result 100;
store result into '$output';
