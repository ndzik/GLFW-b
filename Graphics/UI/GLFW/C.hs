{-# LANGUAGE FlexibleInstances, MultiParamTypeClasses #-}

--------------------------------------------------------------------------------

-- This code is generated by util/genC.hs.

--------------------------------------------------------------------------------

module Graphics.UI.GLFW.C where

--------------------------------------------------------------------------------

import Data.Bits       ((.&.))
import Data.Char       (chr, ord)
import Foreign.C.Types (CDouble, CFloat, CInt, CUChar, CUInt, CUShort)
import Foreign.Ptr     (Ptr)

import Bindings.GLFW
import Graphics.UI.GLFW.Types

--------------------------------------------------------------------------------

class C c h where
  fromC :: c -> h
  toC   :: h -> c

--------------------------------------------------------------------------------

instance C CInt Char where
  fromC = chr . fromIntegral
  toC = fromIntegral . ord

instance C CUInt Char where
  fromC = chr . fromIntegral
  toC = fromIntegral . ord

instance C CDouble Double where
  fromC = realToFrac
  toC = realToFrac

instance C CInt Int where
  fromC = fromIntegral
  toC = fromIntegral

instance C CUInt Int where
  fromC = fromIntegral
  toC = fromIntegral

instance C CUShort Int where
  fromC = fromIntegral
  toC = fromIntegral

instance C CFloat Double where
  fromC = realToFrac
  toC = realToFrac

instance C (Ptr C'GLFWmonitor) Monitor where
  fromC = Monitor
  toC = unMonitor

instance C (Ptr C'GLFWwindow) Window where
  fromC = Window
  toC = unWindow

instance C CInt ModifierKeys where
  fromC v = ModifierKeys
    { modifierKeysShift   = (v .&. c'GLFW_MOD_SHIFT)   /= 0
    , modifierKeysControl = (v .&. c'GLFW_MOD_CONTROL) /= 0
    , modifierKeysAlt     = (v .&. c'GLFW_MOD_ALT)     /= 0
    , modifierKeysSuper   = (v .&. c'GLFW_MOD_SUPER)   /= 0
    }
  toC = undefined

instance C C'GLFWvidmode VideoMode where
  fromC gvm = VideoMode
    { videoModeWidth       = fromIntegral $ c'GLFWvidmode'width       gvm
    , videoModeHeight      = fromIntegral $ c'GLFWvidmode'height      gvm
    , videoModeRedBits     = fromIntegral $ c'GLFWvidmode'redBits     gvm
    , videoModeGreenBits   = fromIntegral $ c'GLFWvidmode'greenBits   gvm
    , videoModeBlueBits    = fromIntegral $ c'GLFWvidmode'blueBits    gvm
    , videoModeRefreshRate = fromIntegral $ c'GLFWvidmode'refreshRate gvm
    }
  toC = undefined

instance C CInt StandardCursorShape where
  fromC v
    | v == c'GLFW_ARROW_CURSOR     = StandardCursorShape'Arrow
    | v == c'GLFW_IBEAM_CURSOR     = StandardCursorShape'IBeam
    | v == c'GLFW_CROSSHAIR_CURSOR = StandardCursorShape'Crosshair
    | v == c'GLFW_HAND_CURSOR      = StandardCursorShape'Hand
    | v == c'GLFW_HRESIZE_CURSOR   = StandardCursorShape'HResize
    | v == c'GLFW_VRESIZE_CURSOR   = StandardCursorShape'VResize
    | otherwise = error $ "C CInt StandardCursorShape fromC: " ++ show v
  toC  StandardCursorShape'Arrow     = c'GLFW_ARROW_CURSOR
  toC  StandardCursorShape'IBeam     = c'GLFW_IBEAM_CURSOR
  toC  StandardCursorShape'Crosshair = c'GLFW_CROSSHAIR_CURSOR
  toC  StandardCursorShape'Hand      = c'GLFW_HAND_CURSOR
  toC  StandardCursorShape'HResize   = c'GLFW_HRESIZE_CURSOR
  toC  StandardCursorShape'VResize   = c'GLFW_VRESIZE_CURSOR

--------------------------------------------------------------------------------

instance C CInt Bool where
  fromC v
    | v == c'GLFW_FALSE = False
    | v == c'GLFW_TRUE = True
    | otherwise = error $ "C CInt Bool fromC: " ++ show v
  toC False = c'GLFW_FALSE
  toC True = c'GLFW_TRUE

instance C CInt Error where
  fromC v
    | v == c'GLFW_NOT_INITIALIZED = Error'NotInitialized
    | v == c'GLFW_NO_CURRENT_CONTEXT = Error'NoCurrentContext
    | v == c'GLFW_INVALID_ENUM = Error'InvalidEnum
    | v == c'GLFW_INVALID_VALUE = Error'InvalidValue
    | v == c'GLFW_OUT_OF_MEMORY = Error'OutOfMemory
    | v == c'GLFW_API_UNAVAILABLE = Error'ApiUnavailable
    | v == c'GLFW_VERSION_UNAVAILABLE = Error'VersionUnavailable
    | v == c'GLFW_PLATFORM_ERROR = Error'PlatformError
    | v == c'GLFW_FORMAT_UNAVAILABLE = Error'FormatUnavailable
    | otherwise = error $ "C CInt Error fromC: " ++ show v
  toC Error'NotInitialized = c'GLFW_NOT_INITIALIZED
  toC Error'NoCurrentContext = c'GLFW_NO_CURRENT_CONTEXT
  toC Error'InvalidEnum = c'GLFW_INVALID_ENUM
  toC Error'InvalidValue = c'GLFW_INVALID_VALUE
  toC Error'OutOfMemory = c'GLFW_OUT_OF_MEMORY
  toC Error'ApiUnavailable = c'GLFW_API_UNAVAILABLE
  toC Error'VersionUnavailable = c'GLFW_VERSION_UNAVAILABLE
  toC Error'PlatformError = c'GLFW_PLATFORM_ERROR
  toC Error'FormatUnavailable = c'GLFW_FORMAT_UNAVAILABLE

instance C CInt MonitorState where
  fromC v
    | v == c'GLFW_CONNECTED = MonitorState'Connected
    | v == c'GLFW_DISCONNECTED = MonitorState'Disconnected
    | otherwise = error $ "C CInt MonitorState fromC: " ++ show v
  toC MonitorState'Connected = c'GLFW_CONNECTED
  toC MonitorState'Disconnected = c'GLFW_DISCONNECTED

instance C CInt ContextRobustness where
  fromC v
    | v == c'GLFW_NO_ROBUSTNESS = ContextRobustness'NoRobustness
    | v == c'GLFW_NO_RESET_NOTIFICATION = ContextRobustness'NoResetNotification
    | v == c'GLFW_LOSE_CONTEXT_ON_RESET = ContextRobustness'LoseContextOnReset
    | otherwise = error $ "C CInt ContextRobustness fromC: " ++ show v
  toC ContextRobustness'NoRobustness = c'GLFW_NO_ROBUSTNESS
  toC ContextRobustness'NoResetNotification = c'GLFW_NO_RESET_NOTIFICATION
  toC ContextRobustness'LoseContextOnReset = c'GLFW_LOSE_CONTEXT_ON_RESET

instance C CInt ContextReleaseBehavior where
  fromC v
    | v == c'GLFW_ANY_RELEASE_BEHAVIOR = ContextReleaseBehavior'Any
    | v == c'GLFW_RELEASE_BEHAVIOR_NONE = ContextReleaseBehavior'None
    | v == c'GLFW_RELEASE_BEHAVIOR_FLUSH = ContextReleaseBehavior'Flush
    | otherwise = error $ "C CInt ContextReleaseBehavior fromC: " ++ show v
  toC ContextReleaseBehavior'Any = c'GLFW_ANY_RELEASE_BEHAVIOR
  toC ContextReleaseBehavior'None = c'GLFW_RELEASE_BEHAVIOR_NONE
  toC ContextReleaseBehavior'Flush = c'GLFW_RELEASE_BEHAVIOR_FLUSH

instance C CInt OpenGLProfile where
  fromC v
    | v == c'GLFW_OPENGL_ANY_PROFILE = OpenGLProfile'Any
    | v == c'GLFW_OPENGL_COMPAT_PROFILE = OpenGLProfile'Compat
    | v == c'GLFW_OPENGL_CORE_PROFILE = OpenGLProfile'Core
    | otherwise = error $ "C CInt OpenGLProfile fromC: " ++ show v
  toC OpenGLProfile'Any = c'GLFW_OPENGL_ANY_PROFILE
  toC OpenGLProfile'Compat = c'GLFW_OPENGL_COMPAT_PROFILE
  toC OpenGLProfile'Core = c'GLFW_OPENGL_CORE_PROFILE

instance C CInt ClientAPI where
  fromC v
    | v == c'GLFW_NO_API = ClientAPI'NoAPI
    | v == c'GLFW_OPENGL_API = ClientAPI'OpenGL
    | v == c'GLFW_OPENGL_ES_API = ClientAPI'OpenGLES
    | otherwise = error $ "C CInt ClientAPI fromC: " ++ show v
  toC ClientAPI'NoAPI = c'GLFW_NO_API
  toC ClientAPI'OpenGL = c'GLFW_OPENGL_API
  toC ClientAPI'OpenGLES = c'GLFW_OPENGL_ES_API

instance C CInt ContextCreationAPI where
  fromC v
    | v == c'GLFW_NATIVE_CONTEXT_API = ContextCreationAPI'Native
    | v == c'GLFW_EGL_CONTEXT_API = ContextCreationAPI'EGL
    | otherwise = error $ "C CInt ContextCreationAPI fromC: " ++ show v
  toC ContextCreationAPI'Native = c'GLFW_NATIVE_CONTEXT_API
  toC ContextCreationAPI'EGL = c'GLFW_EGL_CONTEXT_API

instance C CInt Key where
  fromC v
    | v == c'GLFW_KEY_UNKNOWN = Key'Unknown
    | v == c'GLFW_KEY_SPACE = Key'Space
    | v == c'GLFW_KEY_APOSTROPHE = Key'Apostrophe
    | v == c'GLFW_KEY_COMMA = Key'Comma
    | v == c'GLFW_KEY_MINUS = Key'Minus
    | v == c'GLFW_KEY_PERIOD = Key'Period
    | v == c'GLFW_KEY_SLASH = Key'Slash
    | v == c'GLFW_KEY_0 = Key'0
    | v == c'GLFW_KEY_1 = Key'1
    | v == c'GLFW_KEY_2 = Key'2
    | v == c'GLFW_KEY_3 = Key'3
    | v == c'GLFW_KEY_4 = Key'4
    | v == c'GLFW_KEY_5 = Key'5
    | v == c'GLFW_KEY_6 = Key'6
    | v == c'GLFW_KEY_7 = Key'7
    | v == c'GLFW_KEY_8 = Key'8
    | v == c'GLFW_KEY_9 = Key'9
    | v == c'GLFW_KEY_SEMICOLON = Key'Semicolon
    | v == c'GLFW_KEY_EQUAL = Key'Equal
    | v == c'GLFW_KEY_A = Key'A
    | v == c'GLFW_KEY_B = Key'B
    | v == c'GLFW_KEY_C = Key'C
    | v == c'GLFW_KEY_D = Key'D
    | v == c'GLFW_KEY_E = Key'E
    | v == c'GLFW_KEY_F = Key'F
    | v == c'GLFW_KEY_G = Key'G
    | v == c'GLFW_KEY_H = Key'H
    | v == c'GLFW_KEY_I = Key'I
    | v == c'GLFW_KEY_J = Key'J
    | v == c'GLFW_KEY_K = Key'K
    | v == c'GLFW_KEY_L = Key'L
    | v == c'GLFW_KEY_M = Key'M
    | v == c'GLFW_KEY_N = Key'N
    | v == c'GLFW_KEY_O = Key'O
    | v == c'GLFW_KEY_P = Key'P
    | v == c'GLFW_KEY_Q = Key'Q
    | v == c'GLFW_KEY_R = Key'R
    | v == c'GLFW_KEY_S = Key'S
    | v == c'GLFW_KEY_T = Key'T
    | v == c'GLFW_KEY_U = Key'U
    | v == c'GLFW_KEY_V = Key'V
    | v == c'GLFW_KEY_W = Key'W
    | v == c'GLFW_KEY_X = Key'X
    | v == c'GLFW_KEY_Y = Key'Y
    | v == c'GLFW_KEY_Z = Key'Z
    | v == c'GLFW_KEY_LEFT_BRACKET = Key'LeftBracket
    | v == c'GLFW_KEY_BACKSLASH = Key'Backslash
    | v == c'GLFW_KEY_RIGHT_BRACKET = Key'RightBracket
    | v == c'GLFW_KEY_GRAVE_ACCENT = Key'GraveAccent
    | v == c'GLFW_KEY_WORLD_1 = Key'World1
    | v == c'GLFW_KEY_WORLD_2 = Key'World2
    | v == c'GLFW_KEY_ESCAPE = Key'Escape
    | v == c'GLFW_KEY_ENTER = Key'Enter
    | v == c'GLFW_KEY_TAB = Key'Tab
    | v == c'GLFW_KEY_BACKSPACE = Key'Backspace
    | v == c'GLFW_KEY_INSERT = Key'Insert
    | v == c'GLFW_KEY_DELETE = Key'Delete
    | v == c'GLFW_KEY_RIGHT = Key'Right
    | v == c'GLFW_KEY_LEFT = Key'Left
    | v == c'GLFW_KEY_DOWN = Key'Down
    | v == c'GLFW_KEY_UP = Key'Up
    | v == c'GLFW_KEY_PAGE_UP = Key'PageUp
    | v == c'GLFW_KEY_PAGE_DOWN = Key'PageDown
    | v == c'GLFW_KEY_HOME = Key'Home
    | v == c'GLFW_KEY_END = Key'End
    | v == c'GLFW_KEY_CAPS_LOCK = Key'CapsLock
    | v == c'GLFW_KEY_SCROLL_LOCK = Key'ScrollLock
    | v == c'GLFW_KEY_NUM_LOCK = Key'NumLock
    | v == c'GLFW_KEY_PRINT_SCREEN = Key'PrintScreen
    | v == c'GLFW_KEY_PAUSE = Key'Pause
    | v == c'GLFW_KEY_F1 = Key'F1
    | v == c'GLFW_KEY_F2 = Key'F2
    | v == c'GLFW_KEY_F3 = Key'F3
    | v == c'GLFW_KEY_F4 = Key'F4
    | v == c'GLFW_KEY_F5 = Key'F5
    | v == c'GLFW_KEY_F6 = Key'F6
    | v == c'GLFW_KEY_F7 = Key'F7
    | v == c'GLFW_KEY_F8 = Key'F8
    | v == c'GLFW_KEY_F9 = Key'F9
    | v == c'GLFW_KEY_F10 = Key'F10
    | v == c'GLFW_KEY_F11 = Key'F11
    | v == c'GLFW_KEY_F12 = Key'F12
    | v == c'GLFW_KEY_F13 = Key'F13
    | v == c'GLFW_KEY_F14 = Key'F14
    | v == c'GLFW_KEY_F15 = Key'F15
    | v == c'GLFW_KEY_F16 = Key'F16
    | v == c'GLFW_KEY_F17 = Key'F17
    | v == c'GLFW_KEY_F18 = Key'F18
    | v == c'GLFW_KEY_F19 = Key'F19
    | v == c'GLFW_KEY_F20 = Key'F20
    | v == c'GLFW_KEY_F21 = Key'F21
    | v == c'GLFW_KEY_F22 = Key'F22
    | v == c'GLFW_KEY_F23 = Key'F23
    | v == c'GLFW_KEY_F24 = Key'F24
    | v == c'GLFW_KEY_F25 = Key'F25
    | v == c'GLFW_KEY_KP_0 = Key'Pad0
    | v == c'GLFW_KEY_KP_1 = Key'Pad1
    | v == c'GLFW_KEY_KP_2 = Key'Pad2
    | v == c'GLFW_KEY_KP_3 = Key'Pad3
    | v == c'GLFW_KEY_KP_4 = Key'Pad4
    | v == c'GLFW_KEY_KP_5 = Key'Pad5
    | v == c'GLFW_KEY_KP_6 = Key'Pad6
    | v == c'GLFW_KEY_KP_7 = Key'Pad7
    | v == c'GLFW_KEY_KP_8 = Key'Pad8
    | v == c'GLFW_KEY_KP_9 = Key'Pad9
    | v == c'GLFW_KEY_KP_DECIMAL = Key'PadDecimal
    | v == c'GLFW_KEY_KP_DIVIDE = Key'PadDivide
    | v == c'GLFW_KEY_KP_MULTIPLY = Key'PadMultiply
    | v == c'GLFW_KEY_KP_SUBTRACT = Key'PadSubtract
    | v == c'GLFW_KEY_KP_ADD = Key'PadAdd
    | v == c'GLFW_KEY_KP_ENTER = Key'PadEnter
    | v == c'GLFW_KEY_KP_EQUAL = Key'PadEqual
    | v == c'GLFW_KEY_LEFT_SHIFT = Key'LeftShift
    | v == c'GLFW_KEY_LEFT_CONTROL = Key'LeftControl
    | v == c'GLFW_KEY_LEFT_ALT = Key'LeftAlt
    | v == c'GLFW_KEY_LEFT_SUPER = Key'LeftSuper
    | v == c'GLFW_KEY_RIGHT_SHIFT = Key'RightShift
    | v == c'GLFW_KEY_RIGHT_CONTROL = Key'RightControl
    | v == c'GLFW_KEY_RIGHT_ALT = Key'RightAlt
    | v == c'GLFW_KEY_RIGHT_SUPER = Key'RightSuper
    | v == c'GLFW_KEY_MENU = Key'Menu
    | otherwise = error $ "C CInt Key fromC: " ++ show v
  toC Key'Unknown = c'GLFW_KEY_UNKNOWN
  toC Key'Space = c'GLFW_KEY_SPACE
  toC Key'Apostrophe = c'GLFW_KEY_APOSTROPHE
  toC Key'Comma = c'GLFW_KEY_COMMA
  toC Key'Minus = c'GLFW_KEY_MINUS
  toC Key'Period = c'GLFW_KEY_PERIOD
  toC Key'Slash = c'GLFW_KEY_SLASH
  toC Key'0 = c'GLFW_KEY_0
  toC Key'1 = c'GLFW_KEY_1
  toC Key'2 = c'GLFW_KEY_2
  toC Key'3 = c'GLFW_KEY_3
  toC Key'4 = c'GLFW_KEY_4
  toC Key'5 = c'GLFW_KEY_5
  toC Key'6 = c'GLFW_KEY_6
  toC Key'7 = c'GLFW_KEY_7
  toC Key'8 = c'GLFW_KEY_8
  toC Key'9 = c'GLFW_KEY_9
  toC Key'Semicolon = c'GLFW_KEY_SEMICOLON
  toC Key'Equal = c'GLFW_KEY_EQUAL
  toC Key'A = c'GLFW_KEY_A
  toC Key'B = c'GLFW_KEY_B
  toC Key'C = c'GLFW_KEY_C
  toC Key'D = c'GLFW_KEY_D
  toC Key'E = c'GLFW_KEY_E
  toC Key'F = c'GLFW_KEY_F
  toC Key'G = c'GLFW_KEY_G
  toC Key'H = c'GLFW_KEY_H
  toC Key'I = c'GLFW_KEY_I
  toC Key'J = c'GLFW_KEY_J
  toC Key'K = c'GLFW_KEY_K
  toC Key'L = c'GLFW_KEY_L
  toC Key'M = c'GLFW_KEY_M
  toC Key'N = c'GLFW_KEY_N
  toC Key'O = c'GLFW_KEY_O
  toC Key'P = c'GLFW_KEY_P
  toC Key'Q = c'GLFW_KEY_Q
  toC Key'R = c'GLFW_KEY_R
  toC Key'S = c'GLFW_KEY_S
  toC Key'T = c'GLFW_KEY_T
  toC Key'U = c'GLFW_KEY_U
  toC Key'V = c'GLFW_KEY_V
  toC Key'W = c'GLFW_KEY_W
  toC Key'X = c'GLFW_KEY_X
  toC Key'Y = c'GLFW_KEY_Y
  toC Key'Z = c'GLFW_KEY_Z
  toC Key'LeftBracket = c'GLFW_KEY_LEFT_BRACKET
  toC Key'Backslash = c'GLFW_KEY_BACKSLASH
  toC Key'RightBracket = c'GLFW_KEY_RIGHT_BRACKET
  toC Key'GraveAccent = c'GLFW_KEY_GRAVE_ACCENT
  toC Key'World1 = c'GLFW_KEY_WORLD_1
  toC Key'World2 = c'GLFW_KEY_WORLD_2
  toC Key'Escape = c'GLFW_KEY_ESCAPE
  toC Key'Enter = c'GLFW_KEY_ENTER
  toC Key'Tab = c'GLFW_KEY_TAB
  toC Key'Backspace = c'GLFW_KEY_BACKSPACE
  toC Key'Insert = c'GLFW_KEY_INSERT
  toC Key'Delete = c'GLFW_KEY_DELETE
  toC Key'Right = c'GLFW_KEY_RIGHT
  toC Key'Left = c'GLFW_KEY_LEFT
  toC Key'Down = c'GLFW_KEY_DOWN
  toC Key'Up = c'GLFW_KEY_UP
  toC Key'PageUp = c'GLFW_KEY_PAGE_UP
  toC Key'PageDown = c'GLFW_KEY_PAGE_DOWN
  toC Key'Home = c'GLFW_KEY_HOME
  toC Key'End = c'GLFW_KEY_END
  toC Key'CapsLock = c'GLFW_KEY_CAPS_LOCK
  toC Key'ScrollLock = c'GLFW_KEY_SCROLL_LOCK
  toC Key'NumLock = c'GLFW_KEY_NUM_LOCK
  toC Key'PrintScreen = c'GLFW_KEY_PRINT_SCREEN
  toC Key'Pause = c'GLFW_KEY_PAUSE
  toC Key'F1 = c'GLFW_KEY_F1
  toC Key'F2 = c'GLFW_KEY_F2
  toC Key'F3 = c'GLFW_KEY_F3
  toC Key'F4 = c'GLFW_KEY_F4
  toC Key'F5 = c'GLFW_KEY_F5
  toC Key'F6 = c'GLFW_KEY_F6
  toC Key'F7 = c'GLFW_KEY_F7
  toC Key'F8 = c'GLFW_KEY_F8
  toC Key'F9 = c'GLFW_KEY_F9
  toC Key'F10 = c'GLFW_KEY_F10
  toC Key'F11 = c'GLFW_KEY_F11
  toC Key'F12 = c'GLFW_KEY_F12
  toC Key'F13 = c'GLFW_KEY_F13
  toC Key'F14 = c'GLFW_KEY_F14
  toC Key'F15 = c'GLFW_KEY_F15
  toC Key'F16 = c'GLFW_KEY_F16
  toC Key'F17 = c'GLFW_KEY_F17
  toC Key'F18 = c'GLFW_KEY_F18
  toC Key'F19 = c'GLFW_KEY_F19
  toC Key'F20 = c'GLFW_KEY_F20
  toC Key'F21 = c'GLFW_KEY_F21
  toC Key'F22 = c'GLFW_KEY_F22
  toC Key'F23 = c'GLFW_KEY_F23
  toC Key'F24 = c'GLFW_KEY_F24
  toC Key'F25 = c'GLFW_KEY_F25
  toC Key'Pad0 = c'GLFW_KEY_KP_0
  toC Key'Pad1 = c'GLFW_KEY_KP_1
  toC Key'Pad2 = c'GLFW_KEY_KP_2
  toC Key'Pad3 = c'GLFW_KEY_KP_3
  toC Key'Pad4 = c'GLFW_KEY_KP_4
  toC Key'Pad5 = c'GLFW_KEY_KP_5
  toC Key'Pad6 = c'GLFW_KEY_KP_6
  toC Key'Pad7 = c'GLFW_KEY_KP_7
  toC Key'Pad8 = c'GLFW_KEY_KP_8
  toC Key'Pad9 = c'GLFW_KEY_KP_9
  toC Key'PadDecimal = c'GLFW_KEY_KP_DECIMAL
  toC Key'PadDivide = c'GLFW_KEY_KP_DIVIDE
  toC Key'PadMultiply = c'GLFW_KEY_KP_MULTIPLY
  toC Key'PadSubtract = c'GLFW_KEY_KP_SUBTRACT
  toC Key'PadAdd = c'GLFW_KEY_KP_ADD
  toC Key'PadEnter = c'GLFW_KEY_KP_ENTER
  toC Key'PadEqual = c'GLFW_KEY_KP_EQUAL
  toC Key'LeftShift = c'GLFW_KEY_LEFT_SHIFT
  toC Key'LeftControl = c'GLFW_KEY_LEFT_CONTROL
  toC Key'LeftAlt = c'GLFW_KEY_LEFT_ALT
  toC Key'LeftSuper = c'GLFW_KEY_LEFT_SUPER
  toC Key'RightShift = c'GLFW_KEY_RIGHT_SHIFT
  toC Key'RightControl = c'GLFW_KEY_RIGHT_CONTROL
  toC Key'RightAlt = c'GLFW_KEY_RIGHT_ALT
  toC Key'RightSuper = c'GLFW_KEY_RIGHT_SUPER
  toC Key'Menu = c'GLFW_KEY_MENU

instance C CInt KeyState where
  fromC v
    | v == c'GLFW_PRESS = KeyState'Pressed
    | v == c'GLFW_RELEASE = KeyState'Released
    | v == c'GLFW_REPEAT = KeyState'Repeating
    | otherwise = error $ "C CInt KeyState fromC: " ++ show v
  toC KeyState'Pressed = c'GLFW_PRESS
  toC KeyState'Released = c'GLFW_RELEASE
  toC KeyState'Repeating = c'GLFW_REPEAT

instance C CInt Joystick where
  fromC v
    | v == c'GLFW_JOYSTICK_1 = Joystick'1
    | v == c'GLFW_JOYSTICK_2 = Joystick'2
    | v == c'GLFW_JOYSTICK_3 = Joystick'3
    | v == c'GLFW_JOYSTICK_4 = Joystick'4
    | v == c'GLFW_JOYSTICK_5 = Joystick'5
    | v == c'GLFW_JOYSTICK_6 = Joystick'6
    | v == c'GLFW_JOYSTICK_7 = Joystick'7
    | v == c'GLFW_JOYSTICK_8 = Joystick'8
    | v == c'GLFW_JOYSTICK_9 = Joystick'9
    | v == c'GLFW_JOYSTICK_10 = Joystick'10
    | v == c'GLFW_JOYSTICK_11 = Joystick'11
    | v == c'GLFW_JOYSTICK_12 = Joystick'12
    | v == c'GLFW_JOYSTICK_13 = Joystick'13
    | v == c'GLFW_JOYSTICK_14 = Joystick'14
    | v == c'GLFW_JOYSTICK_15 = Joystick'15
    | v == c'GLFW_JOYSTICK_16 = Joystick'16
    | otherwise = error $ "C CInt Joystick fromC: " ++ show v
  toC Joystick'1 = c'GLFW_JOYSTICK_1
  toC Joystick'2 = c'GLFW_JOYSTICK_2
  toC Joystick'3 = c'GLFW_JOYSTICK_3
  toC Joystick'4 = c'GLFW_JOYSTICK_4
  toC Joystick'5 = c'GLFW_JOYSTICK_5
  toC Joystick'6 = c'GLFW_JOYSTICK_6
  toC Joystick'7 = c'GLFW_JOYSTICK_7
  toC Joystick'8 = c'GLFW_JOYSTICK_8
  toC Joystick'9 = c'GLFW_JOYSTICK_9
  toC Joystick'10 = c'GLFW_JOYSTICK_10
  toC Joystick'11 = c'GLFW_JOYSTICK_11
  toC Joystick'12 = c'GLFW_JOYSTICK_12
  toC Joystick'13 = c'GLFW_JOYSTICK_13
  toC Joystick'14 = c'GLFW_JOYSTICK_14
  toC Joystick'15 = c'GLFW_JOYSTICK_15
  toC Joystick'16 = c'GLFW_JOYSTICK_16

instance C CUChar JoystickButtonState where
  fromC v
    | v == c'GLFW_PRESS = JoystickButtonState'Pressed
    | v == c'GLFW_RELEASE = JoystickButtonState'Released
    | otherwise = error $ "C CUChar JoystickButtonState fromC: " ++ show v
  toC JoystickButtonState'Pressed = c'GLFW_PRESS
  toC JoystickButtonState'Released = c'GLFW_RELEASE

instance C CInt JoystickState where
  fromC v
    | v == c'GLFW_CONNECTED = JoystickState'Connected
    | v == c'GLFW_DISCONNECTED = JoystickState'Disconnected
    | otherwise = error $ "C CInt JoystickState fromC: " ++ show v
  toC JoystickState'Connected = c'GLFW_CONNECTED
  toC JoystickState'Disconnected = c'GLFW_DISCONNECTED

instance C CInt MouseButton where
  fromC v
    | v == c'GLFW_MOUSE_BUTTON_1 = MouseButton'1
    | v == c'GLFW_MOUSE_BUTTON_2 = MouseButton'2
    | v == c'GLFW_MOUSE_BUTTON_3 = MouseButton'3
    | v == c'GLFW_MOUSE_BUTTON_4 = MouseButton'4
    | v == c'GLFW_MOUSE_BUTTON_5 = MouseButton'5
    | v == c'GLFW_MOUSE_BUTTON_6 = MouseButton'6
    | v == c'GLFW_MOUSE_BUTTON_7 = MouseButton'7
    | v == c'GLFW_MOUSE_BUTTON_8 = MouseButton'8
    | otherwise = error $ "C CInt MouseButton fromC: " ++ show v
  toC MouseButton'1 = c'GLFW_MOUSE_BUTTON_1
  toC MouseButton'2 = c'GLFW_MOUSE_BUTTON_2
  toC MouseButton'3 = c'GLFW_MOUSE_BUTTON_3
  toC MouseButton'4 = c'GLFW_MOUSE_BUTTON_4
  toC MouseButton'5 = c'GLFW_MOUSE_BUTTON_5
  toC MouseButton'6 = c'GLFW_MOUSE_BUTTON_6
  toC MouseButton'7 = c'GLFW_MOUSE_BUTTON_7
  toC MouseButton'8 = c'GLFW_MOUSE_BUTTON_8

instance C CInt MouseButtonState where
  fromC v
    | v == c'GLFW_PRESS = MouseButtonState'Pressed
    | v == c'GLFW_RELEASE = MouseButtonState'Released
    | otherwise = error $ "C CInt MouseButtonState fromC: " ++ show v
  toC MouseButtonState'Pressed = c'GLFW_PRESS
  toC MouseButtonState'Released = c'GLFW_RELEASE

instance C CInt CursorState where
  fromC v
    | v == c'GLFW_TRUE = CursorState'InWindow
    | v == c'GLFW_FALSE = CursorState'NotInWindow
    | otherwise = error $ "C CInt CursorState fromC: " ++ show v
  toC CursorState'InWindow = c'GLFW_TRUE
  toC CursorState'NotInWindow = c'GLFW_FALSE

instance C CInt CursorInputMode where
  fromC v
    | v == c'GLFW_CURSOR_NORMAL = CursorInputMode'Normal
    | v == c'GLFW_CURSOR_HIDDEN = CursorInputMode'Hidden
    | v == c'GLFW_CURSOR_DISABLED = CursorInputMode'Disabled
    | otherwise = error $ "C CInt CursorInputMode fromC: " ++ show v
  toC CursorInputMode'Normal = c'GLFW_CURSOR_NORMAL
  toC CursorInputMode'Hidden = c'GLFW_CURSOR_HIDDEN
  toC CursorInputMode'Disabled = c'GLFW_CURSOR_DISABLED

instance C CInt StickyKeysInputMode where
  fromC v
    | v == c'GLFW_TRUE = StickyKeysInputMode'Enabled
    | v == c'GLFW_FALSE = StickyKeysInputMode'Disabled
    | otherwise = error $ "C CInt StickyKeysInputMode fromC: " ++ show v
  toC StickyKeysInputMode'Enabled = c'GLFW_TRUE
  toC StickyKeysInputMode'Disabled = c'GLFW_FALSE

instance C CInt StickyMouseButtonsInputMode where
  fromC v
    | v == c'GLFW_TRUE = StickyMouseButtonsInputMode'Enabled
    | v == c'GLFW_FALSE = StickyMouseButtonsInputMode'Disabled
    | otherwise = error $ "C CInt StickyMouseButtonsInputMode fromC: " ++ show v
  toC StickyMouseButtonsInputMode'Enabled = c'GLFW_TRUE
  toC StickyMouseButtonsInputMode'Disabled = c'GLFW_FALSE

--------------------------------------------------------------------------------

{-# ANN module "HLint: ignore Use camelCase" #-}