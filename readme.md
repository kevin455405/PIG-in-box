PIG-in-box
==========

Find top 100 authors in dataset using PIG.
 - [pig-0.14.0]{http://archive.apache.org/dist/pig/pig-0.14.0/}
 - [dataset]{http://projects.csail.mit.edu/dnd/DBLP/dblp.json.gz}
 - $ pig -param input='dblp.json' -param output='output' -x local TopPigInBox.pig
