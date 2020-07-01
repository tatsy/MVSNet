import numpy as np
from matplotlib import cm

import tensorflow as tf

def tf_colorize(values, vmin=0.0, vmax=1.0, cmap='rainbow'):
    if vmin is None:
        vmin = tf.reduce_min(values, axis=[1, 2, 3], keepdims=True)

    if vmax is None:
        vmax = tf.reduce_min(values, axis=[1, 2, 3], keepdims=True)

    values = tf.clip_by_value(values, vmin, vmax)
    values = (values - vmin) / (vmax - vmin)
    indices = tf.to_int32(tf.round(values * 255.0))
    indices = tf.squeeze(indices, axis=3)

    colormap = cm.get_cmap(cmap if cmap is not None else 'gray')
    colors = colormap(np.arange(256))[:, :3]
    colors = tf.constant(colors, dtype='float32')

    ret = tf.gather(colors, indices)
    return ret

