# pcdpexample

An analysis of disparites in ED length of stay using the PCDP 2014 public use data set.

To generate the database required by the example, download the PCDP data and copy in the 2014 CSV files into the data directory. Open a terminal and move into the data directory, then type `sqlite3 pcdp.sqlite3` followed by `.read pcdp.sql` (intall the sqlite3 client if needed beforehand).

Other than that, a standard Anaconda install of Python 3 should allow the rest of the code to run.
