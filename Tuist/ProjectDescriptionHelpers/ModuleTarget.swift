import Foundation

public enum ModuleTarget: Hashable {
  case staticLibrary
  case dynamicFramework
  //unitTest 타겟을 만들지에 대한 여부
  case unitTest
  //unitTest / DemoApp 필요한 Source코드를 위한 타겟을 만들지에대한 여부
  //dynamicFramework 생성된다
  case testSourceModule
  //demoApp 타겟을 만들지에대한 여부
  case demoApp

  public func getTargetName(name: String) -> String {
    switch self {
    case .staticLibrary, .dynamicFramework:
      return name
    case .unitTest:
      return name + "UnitTest"
    case .testSourceModule:
      return name + "TestSources"
    case .demoApp:
      return name + "DemoApp"
    }
  }
}
