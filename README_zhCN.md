# 关于这个分支
这个分支来源于原作者[Noiredd](https://github.com/Noiredd)的PEGAS项目，一个将航天飞机发射导航算法使用kOS在坎巴拉太空计划中的实现。

# PEGAS
*Powered Explicit Guidance Ascent System*, 又被称为 *PEGAS*，是一个在坎巴拉太空计划中使用[kOS](http://forum.kerbalspaceprogram.com/index.php?/topic/61827-122-kos-scriptable-autopilot-system-v103-20161207/)实现的自动发射系统。这个系统可以被用来在安装了[真实大修模组](http://forum.kerbalspaceprogram.com/index.php?/topic/155700-113-realism-overhaul)的游戏中进行自动发射。

这个发射系统实现了现实世界中的***Unified Powered Flight Guidance***算法，也就是被用在航天飞机发射中的算法。

这个系统主要包括了以下特性：
* 估算发射窗口
* 计算发射方位角
* 简单的大气中制导，制导的方式是对火箭施加一个小的俯仰角，然后保持火箭的姿态与速度方向相同（即保持0°攻角）
* 自动入轨导航由以下参数控制：
  * 远拱点
  * 近拱点
  * 轨道倾角
  * 升交点经度
  * 或者，选取一个目标飞行器
* 执行由时间控制的事件（例如发动机点火、抛整流罩等）
* 自动分级并且包含沉底控制

More info on my KSP [forum thread](http://forum.kerbalspaceprogram.com/index.php?/topic/142213-pegas-powered-explicit-guidance-ascent-system-devlog/), also see my [prototype repository](https://github.com/Noiredd/PEGAS-MATLAB).

## **[Version 1.1 is here!](https://github.com/Noiredd/PEGAS/releases/tag/v1.1)**

### How to use
1. Make sure you have [kOS](http://forum.kerbalspaceprogram.com/index.php?/topic/61827-122-kos-scriptable-autopilot-system-v103-20161207/) installed. Note: [basic](http://ksp-kos.github.io/KOS_DOC/language.html) knowledge of kOS will be very handy.
2. Dowload files from this repository's [kOS folder](kOS) and place them in your `Script` folder.
3. Define your vehicle and mission - see [tutorial](docs/tutorial.md) and [reference](docs/reference.md).
4. Once on the launch pad, load the definitions from pt. 2. and type `run pegas.` in kOS terminal.

### How to get help
PEGAS is not a magical do-it-all, it needs some effort set up and get running.
It has been tested with several launch vehicles, from real-world launchers like Atlas V or Saturn V, through user-made vehicles, both in RO and vanilla settings.
However, I cannot guarantee that it will handle *any* vehicle or that it is entirely bug-free.
Likely, it will take you several tries before you get your rocket flying - and maybe you will find yourself unable to do that at all.
I am willing to provide support, correct bugs and (to some extent) introduce new functionalities to PEGAS.
In case of problems: read the [how to submit issues](docs/issues.md) page and then visit the issue tracker.

### Demo
Here is a video demonstration of the initial release of PEGAS in action, flying an Atlas V to parking orbit aligned with the International Space Station.
It mostly focuses on explanation of the underlying guidance algorithm, only showcasing what functions PEGAS *has* instead of explaining how to use them.
For that I strongly recommend reading the [tutorial](docs/tutorial.md).

<a href="https://youtu.be/NEQD7AQoLXk" target="_blank"><img src="http://img.youtube.com/vi/NEQD7AQoLXk/0.jpg" width="240" height="180" border="10" /></a>

### Note about this repository
I have been using tabs throughout the whole code, having its length set to 4 spaces in all my editors.
I was unaware that github uses length of 8 - as a result, some of the `.ks` files look *really* bad.
If your eyes hurt, you can force github to display them with tab size of 4 spaces by adding `?ts=4` to the URL of the file you're viewing.
Unfortunately there is no way to make it a global setting (or even configure it for the repository).
