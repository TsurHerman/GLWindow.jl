function is_ci()
    get(ENV, "TRAVIS", "") == "true" ||
    get(ENV, "APPVEYOR", "") == "true" ||
    get(ENV, "CI", "") == "true"
end

using GLWindow
using Base.Test

if !is_ci() # only do test if not CI... this is for automated testing environments which fail for OpenGL stuff, but I'd like to test if at least including works

GLFW.Init()
window = Screen("test", resolution=(500,500))

swapbuffers(window)

poll_glfw()

end
println("success")

using GLWindow
@async while true
    GLWindow.poll_glfw()
    sleep(0.001)
end
w = Screen(fullscreen = true)
# GLWindow.make_fullscreen!(w)
