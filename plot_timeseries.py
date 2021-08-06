def plot_timeseries(axes, x, y, color, xlabel, ylabel):
	axes.plot(x, y, color=color)
	axes.set_xlabel(xlabel)
	axes.set_ylabel(ylabel)
	axes.tick_params('y', colors=color)