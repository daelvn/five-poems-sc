Setting.addRange("masterVolume", {
	label    : "Master volume.",
	min      : 0,
	max      : 100,
	step     : 1,
	onChange : function () {
		SimpleAudio.volume(settings.masterVolume / 100);
	}
});