w1 = 5.0
w2 = 4.0
t = np.linspace(0.0,10,101)
x = np.cos(w1 * t)
y = np.cos(w2 * t)
plt.ion()
plt.plot(x,y,"y",lw=1.5)
plt.savefig("naem.png")
