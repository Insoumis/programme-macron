import json
import httplib2
import re
import markdown2
import xml.etree.cElementTree as ET
import os.path

def get_measures(section, measure):
    h = httplib2.Http('.cache')    
    response, content = h.request('https://laec.fr/api/section/' + section + '.json')
  
    data = json.loads(content.decode('utf-8'))
    data = data['data']

    data['foreword'] = str(markdown2.markdown(data['foreword']))

    for m in data['measures']:
        m['body'] = str(markdown2.markdown(m['body']))

    measures = { 'title': data['title'], 'measures':data['measures']} if measure == 0 else {'measures': [data['measures'][measure-1]] }
    return measures

def parse_refs():
    with open("laec") as f:
        content = f.readlines()
        for l in content:
            m = re.match("https://laec.fr/section/([0-9]*)/", l)
            ref = {'s': '0', 'm': '0'}
            if m:
                ref['s'] = m.group(1)
            else:
                m = re.match("https://laec.fr/s([0-9]*)(m([0-9]*)?)", l)
                if m:
                    ref['s'] = m.group(1)
                    try:
                        ref['m'] = m.group(3)
                    except:
                        continue

            if ref['s'] == '0':
              continue

            if os.path.isfile("tmp/laec_s" + ref['s'] + "m" + ref['m'] + ".xml"):
              continue

            measures = get_measures(ref['s'], int(ref['m']))

            root = ET.Element("measures", title=measures['title']) if 'title' in measures else ET.Element("measures")

            for m in measures['measures']:
                root.append(ET.fromstring('<measure>' + m['body'] + '</measure>'))

            tree = ET.ElementTree(root)
            tree.write("tmp/laec_s" + ref['s'] + "m" + ref['m'] + ".xml")
            
                
      

parse_refs()
