enum ExitCode {
    case success
    case failure

    init (from int: Int32) {
        switch int {
        case 0:  self = .success // c-libsodium returns '0' on success
        default: self = .failure
        }
    }
}

extension Int32 {
    var exitCode: ExitCode { return ExitCode(from: self) }
}
