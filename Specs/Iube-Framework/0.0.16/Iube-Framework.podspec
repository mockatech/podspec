Pod::Spec.new do |spec|
    spec.name                     = 'Iube-Framework'
    spec.version                  = '0.0.16'
    spec.homepage                 = 'https://github.com/mockatech/iube-framework'
    spec.source                   = { :git => "https://github.com/mockatech/iube-framework.git", :tag => "#{spec.version}" }
    spec.author                   = { "Theo" => "theolm.mota@gmail.com" }
    spec.license                  = ''
    spec.summary                  = 'A short description of Iube-Framework.'

    spec.static_framework         = true
    spec.vendored_frameworks      = "build/cocoapods/framework/shared.framework"
    spec.libraries                = "c++"
    spec.module_name              = "Iube-Framework"

    spec.ios.deployment_target = '14.1'

                

    spec.pod_target_xcconfig = {
        'KOTLIN_TARGET[sdk=iphonesimulator*]' => 'ios_x64',
        'KOTLIN_TARGET[sdk=iphoneos*]' => 'ios_arm',
        'KOTLIN_TARGET[sdk=watchsimulator*]' => 'watchos_x64',
        'KOTLIN_TARGET[sdk=watchos*]' => 'watchos_arm',
        'KOTLIN_TARGET[sdk=appletvsimulator*]' => 'tvos_x64',
        'KOTLIN_TARGET[sdk=appletvos*]' => 'tvos_arm64',
        'KOTLIN_TARGET[sdk=macosx*]' => 'macos_x64'
    }

    spec.script_phases = [
        {
            :name => 'Build shared',
            :execution_position => :before_compile,
            :shell_path => '/bin/sh',
            :script => <<-SCRIPT
                set -ev
                REPO_ROOT="$PODS_TARGET_SRCROOT"
                "$REPO_ROOT/../gradlew" -p "$REPO_ROOT" :shared:syncFramework \
                    -Pkotlin.native.cocoapods.target=$KOTLIN_TARGET \
                    -Pkotlin.native.cocoapods.configuration=$CONFIGURATION \
                    -Pkotlin.native.cocoapods.cflags="$OTHER_CFLAGS" \
                    -Pkotlin.native.cocoapods.paths.headers="$HEADER_SEARCH_PATHS" \
                    -Pkotlin.native.cocoapods.paths.frameworks="$FRAMEWORK_SEARCH_PATHS"
            SCRIPT
        }
    ]
end