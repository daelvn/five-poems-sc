// $(document).on(":typingstart", function (ev) {
//   console.log("_lastType:", State.temporary.lastType);
//   console.log("$(_lastType):", $(State.temporary.lastType));
//   if (State.temporary.lastType) {
//     // $(State.temporary.lastType).removeClass('macro-type-cursor');
//     let typew = document.getElementById(State.temporary.lastType);
//     // typew.classList.remove("macro-type-cursor");
//     setTimeout(() => typew.classList.remove("macro-type-cursor", 10));
//     delete State.temporary.lastType;
//   }
// })

// $(document).on(":typingstart", function (ev) {
//   setTimeout(() => $('.macro-type-done').removeClass('macro-type-cursor'), Engine.minDomActionDelay);
// });

$(document).on(":typingstart", () => $('.macro-type-done').removeClass('macro-type-cursor'));