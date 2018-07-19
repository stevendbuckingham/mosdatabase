import pdb
def importFromSpreadsheet(spreadsheet):
    import pandas as pd
    ext = spreadsheet.split('.')[-1]
    try:
        if ext == 'csv':
            conditions = pd.read_csv(spreadsheet)
        if ext == 'xlsx':
            conditions = pd.read_excel(spreadsheet)
    except:
        error('could not load conditions')
    return conditions
