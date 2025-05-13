import ProjectDescription

private let layerAttribute = Template.Attribute.optional("layer", default: "4_FeatureLayer")
private let nameAttribute = Template.Attribute.required("name")

private let template = Template(
    description: "features template",
    attributes: [
        layerAttribute,
        nameAttribute,
        .optional("platform", default: "iOS")
    ],
    items: [
        //feature
        featureItems(),
        //테스트코드
        unitTestItems(),
        //데모앱
        demoAppItems(),
        //테스트코드소스
        unitTestSourcesItems(),
        //Interface
        InterfaceItems()
    ].flatMap { $0 }
)

func featureItems() -> [ProjectDescription.Template.Item] {
    return [
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/\(nameAttribute)Feature/Sources/Sources.swift",
            templatePath: "Sources.stencil"
        ),
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/\(nameAttribute)Feature/Project.swift",
            templatePath: "FeatureProject.stencil"
        )
    ]
}

func unitTestItems() -> [ProjectDescription.Template.Item] {
    return [
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/\(nameAttribute)Feature/TestFolder/Test/Sources/Sources.swift",
            templatePath: "Sources.stencil"
        ),
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/\(nameAttribute)Feature/TestFolder/Test/Resources/EmptyJson.json",
            templatePath: "EmptyJson.stencil"
        )
    ]
}

func demoAppItems() -> [ProjectDescription.Template.Item] {
    return [
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/\(nameAttribute)Feature/TestFolder/DemoApp/Sources/AppDelegate.swift",
            templatePath: "AppDelegate.stencil"
        ),
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/\(nameAttribute)Feature/TestFolder/DemoApp/Resources/EmptyJson.json",
            templatePath: "EmptyJson.stencil"
        )
    ]
}

func unitTestSourcesItems() -> [ProjectDescription.Template.Item] {
    return [
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/\(nameAttribute)Feature/TestFolder/UnitTestSources/Sources/Sources.swift",
            templatePath: "Sources.stencil"
        ),
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/\(nameAttribute)Feature/TestFolder/UnitTestSources/Resources/EmptyJson.json",
            templatePath: "EmptyJson.stencil"
        )
    ]
}

func InterfaceItems() -> [ProjectDescription.Template.Item] {
    return [
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/\(nameAttribute)Interface/Sources/Sources.swift",
            templatePath: "Sources.stencil"
        ),
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/\(nameAttribute)Interface/Project.swift",
            templatePath: "InterfaceProject.stencil"
        ),
    ]
}
