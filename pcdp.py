import sqlite3
import pandas as pd

def load_data(data):
    """Load data from pcdp.sqlite3 (assumed to exist in data/) the visit
    table from pcdp.sqlite3 and converts selected columns to
    categories

    """

    with sqlite3.connect('data/pcdp.sqlite3') as conn:
        tables = pd.read_sql_query('select * from sqlite_master', conn)
        result = pd.read_sql_query('select * from {}'.format(data), conn)

        for column in result.columns:
            if 'lkup_' + column in list(tables.tbl_name):
                fmt = pd.read_sql_query('select Code, Descr from lkup_{}'.format(column), conn)
                fmt = fmt.dropna()
                series = pd.Categorical(result[column], categories=fmt.Code, ordered=True)
                series.set_categories(fmt.Descr, rename=True, inplace=True)
                result[column] = series

    return result
