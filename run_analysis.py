import os
import pandas as pd
import re
import zipfile
from urllib import request

url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
archive_fn = 'dataset.zip'

# Download dataset
if not os.path.exists(archive_fn):
    request.urlretrieve(url, archive_fn)
# with zipfile.ZipFile(archive_fn, 'r') as zip_ref:
#     zip_ref.extractall('.')

# Path variables
data_root = f'.{os.path.sep}UCI HAR Dataset{os.path.sep}'
train_root = f'{data_root}train{os.path.sep}'
test_root = f'{data_root}test{os.path.sep}'


# Read dataset function
def read_dataset(root, act_labels, ftr_labels,
                 dataset_fn, subject_col_fn, act_col_fn):
    subject_col = pd.read_csv(f'{root}{subject_col_fn}',
                              names=['subject_id'])
    activity_col = pd.read_csv(f'{root}{act_col_fn}',
                               names=['id']).merge(act_labels)[['activity']]
    dataset = pd.read_fwf(f'{root}{dataset_fn}',
                          usecols=ftr_labels['id'],
                          names=ftr_labels['feature'])
    return pd.concat([subject_col, activity_col, dataset], axis=1)


# Read labels
act_labels = pd.read_csv(f'{data_root}activity_labels.txt',
                         sep=' ',
                         names=['id', 'activity'])
ftr_labels = pd.read_csv(f'{data_root}features.txt',
                         sep=' ',
                         names=['id', 'feature'])

# Filter feature labels: include mean() and std()
ftr_labels = ftr_labels[ftr_labels['feature'].str.match(r'.*(mean|std)\(\).*')]
# Represent index from 0, not 1
ftr_labels['id'] = ftr_labels['id'] - 1
# Clean labels
ftr_labels['feature'] = ftr_labels['feature'].\
    str.replace(r'\(\)', '', regex=True).\
    str.replace('-', '_')

# Read dataset
train_all = read_dataset(train_root, act_labels, ftr_labels,
                         'X_train.txt', 'subject_train.txt', 'y_train.txt')
test_all = read_dataset(test_root, act_labels, ftr_labels,
                        'X_test.txt', 'subject_test.txt', 'y_test.txt')
# Merge traning and test datasets
df = pd.concat([train_all, test_all], axis=0).\
    melt(id_vars=['subject_id', 'activity'])
summary = df.groupby(['subject_id', 'activity', 'variable'])['value'].agg(average='mean')
summary.to_csv('tidy_data.txt')