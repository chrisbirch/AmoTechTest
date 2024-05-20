
import Foundation

@propertyWrapper
public struct Inject<T> {
    public let wrappedValue: T
    public init() {
        wrappedValue = Resolver.shared.resolve()
    }
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}

public class Resolver {

    private var storage = [String: Any]()

    public static let shared = Resolver()
    private init() {}
    private func clear() {
        storage = [:]
    }

    private func addLibraryServices() {
    }
    @discardableResult public func reset(addLibraryServicesBack: Bool = true, addItems: ((Resolver) -> Void)!) -> Self {
        clear()
        if addLibraryServicesBack { addLibraryServices() }
        addItems(self)
        return self
    }

    @discardableResult public func add<T>(_ injectable: T) -> Self {
        let key = String(describing: T.self)
        storage[key] = injectable
        return self
    }

    public func resolve<T>() -> T {
        let key = String(describing: T.self)
        guard let injectable = storage[key] as? T else {
            fatalError("\(key) has not been added as an injectable object.")
        }

        return injectable
    }
}

