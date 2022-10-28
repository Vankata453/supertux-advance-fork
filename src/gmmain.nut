::startMain <- function() {
	stopMusic()
	songPlay(musTheme)
	game = createNewGameObject()
	drawBG = dbgOceanMoving
	gvGameMode = gmMain
	actor = {}
	menu = meMain
	autocon = {
		up = false
		down = false
		left = false
		right = false
	}
	gvLight = 0xffffffff
	gvLightTarget = 0xffffffff
	levelEndRunner = 0
}

::gmMain <- function()
{
	setDrawTarget(gvScreen)
	drawBG()
	runActors()
	drawSprite(sprTitle, 0, screenW() / 2, 16)
	drawDebug()

	drawText(fontC, 0, screenH() - 8, "Brux GDK " + bruxVersion() + " - STA v" + gvVersion + " - " + getOS())
	textMenu()

	resetDrawTarget()
	drawImage(gvScreen, 0, 0)
}
