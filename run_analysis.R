library(reshape2)
library(dplyr)

# setting paths variables
data_root <- './UCI HAR Dataset/'
train_root <- paste0(data_root, 'train/')
test_root <- paste0(data_root, 'test/')

# function for importing the datasets
read_dataset <- function (root, activity_lab, feature_lab, dataset_fn,
                          activity_col_fn, subject_col_fn) {
  widths = rep(16, nrow(feature_lab))
  dataset <- read.fwf(paste0(root, dataset_fn), 
                      widths = widths, 
                      header = FALSE)
  act_col <- read.table(paste0(root, activity_col_fn), 
                        header = FALSE,
                        col.names = c('activity_id'))
  subj_col <- read.table(paste0(root, subject_col_fn), 
                         header = FALSE,
                         col.names = c('subject_id'))
  act_col <- merge(activity_lab, act_col, by.x = 'id', by.y = 'activity_id')
  dataset <- cbind(subj_col, act_col$activity, dataset)
  names(dataset) <- c(names(subj_col), names(act_col)[2], feature_lab$feature)
  return(dataset)
}

# activity labels
act_label <- read.table(paste0(data_root, 'activity_labels.txt'),
                       header = FALSE,
                       sep = ' ',
                       col.names = c('id', 'activity'))
# feature/measurement labels
ftr_label_all <- read.table(paste0(data_root, 'features.txt'),
                       header = FALSE,
                       sep = ' ',
                       col.names = c('id', 'feature'),
                       stringsAsFactors = FALSE)

# train and test datasets
train_all <- read_dataset(train_root, act_label, ftr_label_all,
                          'X_train.txt', 'y_train.txt', 'subject_train.txt')
test_all <- read_dataset(test_root, act_label, ftr_label_all,
                         'X_test.txt', 'y_test.txt', 'subject_test.txt')

# merge train and test datasets
df <- rbind(train_all, test_all)

# select only mean and std measurements
ftr_selected <- grep('mean\\(\\)|std\\(\\)', 
                     ftr_label_all$feature)
df <- df[, c(1, 2, ftr_selected + 2)]

# cleaning column names
names(df) <- gsub('\\(\\)', '', names(df))
names(df) <- gsub('-', '_', names(df))
 
# reshaping and summarising the dataset
df_long <- melt(df, id.vars = c('subject_id', 'activity'))
avg_tidy <- df_long %>%
  group_by(activity, subject_id, variable) %>%
  summarise(average = mean(value))

# saving the datasets
write.table(df, './full_dataset.txt', row.names = FALSE)
write.table(avg_tidy, './summarised_dataset.txt', row.names = FALSE)

