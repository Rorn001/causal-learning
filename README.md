# Causal Learning for Social Science Replication Package

Make sure you installed the following packages:
```
%pip install tensorflow==2.15.0 
%pip install optuna
%pip install cfl
%pip install keras
%pip install optuna-integration[tfkeras]
```
Check your version of the packages:
```
import keras
import tensorflow
import cfl
import optuna
print(keras.__version__)
print(tensorflow.__version__)
print(optuna.__version__)
print(cfl.__version__)
```
Import all packages:
```
import numpy as np
from sklearn.model_selection import train_test_split
import visual_bars.generate_visual_bars_data as vbd
from cfl.experiment import Experiment
import optuna
from optuna.integration import TFKerasPruningCallback
from optuna.trial import TrialState
from keras import Sequential
from keras.layers import Dense, Dropout
```

All data in the `preprocessed_data` folder are cleaned. You can go to the `import preprocessed data` section in the notebook directly.  
