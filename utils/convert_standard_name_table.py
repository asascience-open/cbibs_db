#!/usr/bin/env python
# -*- coding: utf-8 -*-
from lxml.etree import fromstring, tostring
import requests
import urlparse
import xmltodict
import pandas as pd
"""Converts the CF standard name table to CSV format"""

url = 'http://cfconventions.org/Data/cf-standard-names/29/src/cf-standard-name-table.xml'
version_number = urlparse.urlsplit(url).path.split('/')[3]
elems = fromstring(requests.get(url).content).findall('entry')
raw_df = pd.DataFrame([xmltodict.parse(tostring(e))['entry'] for e in elems])
df = raw_df.drop('@xmlns:xsi', axis=1)\
           .rename(columns={'@id': 'standard_name'})\
           .set_index('standard_name') # optional, but probably useful
                                       # if you want to use the df instead of
                                       # csv
df.to_csv("cf_standard_name_table_v{}.csv".format(version_number),
          encoding='utf-8')
