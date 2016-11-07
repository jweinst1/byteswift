struct byteswift {

    
    
    //data structure to act as a list of bytes
    struct ByteList {
        var items:[UInt8]
        
        var full:Bool {
            return items.count == 256
        }
        
        subscript(i:UInt8) -> UInt8 {
            get {
                if i <= 255 && i > 0 {
                    return items[Int(i)]
                }
                else {
                    return 0
                }
            }
            set {
                if i <= 255 && i > 0 {
                    items[Int(i)] = newValue
                }
            }
        }
        
        mutating func append(e:UInt8) -> Void {
            if !full {
                items.append(e)
            }
        }
        
        mutating func pop() -> UInt8 {
            if let num = items.popLast() {
                return num
            }
            else {
                return 0
            }
        }
        
        mutating func remove(i:UInt8) -> Void {
            items.remove(at: Int(i))
        }
        
        mutating func insert(i:UInt8, e:UInt8) -> Void {
            if i <= 255 && i > 0 && !full {
                items.insert(e, at: Int(i))
            }
        }
    }
    
    //data structure that acts as a dictionary of bytes
    struct ByteMap {
        var map:[UInt8:UInt8]
        
        var full:Bool {
            return map.count == 256
        }
        
        subscript(i:UInt8) -> UInt8 {
            get {
                if let val = map[i] {
                    return val
                }
                else {
                    return 0
                }
            }
            set {
                if i <= 255 && i > 0 {
                    map[i] = newValue
                }
            }
        }
    }
    
    //turns a string into an array of bytes
    static func asByteArray(input:String) -> [UInt8] {
        return input.utf8.map{UInt8($0)}
    }
    
    static func stringFromBytes(bytes:[UInt8]) -> String? {
        return String(bytes:bytes, encoding: String.Encoding.utf8)!
    }
    
    //makes an integer from a byte array
    static func fromByteArray(bytes: [UInt8]) -> Int {
        var int = 0
        
        for (offset, byte) in bytes.enumerated() {
            let factor: Double = Double(bytes.count) - (Double(offset) + 1);
            let size: Double = 256
            
            int += Int(byte) * Int(pow(size, factor))
        }
        
        return int
    }
    
    //data strcuture to work with trees of bytes
    struct ByteTree {
        var byte:UInt8 = 0
        var children:[ByteTree] = [ByteTree]()
        
        subscript(i:UInt8) -> UInt8 {
            get {
                if i <= 255 && i > 0 {
                    return children[Int(i)].byte
                }
                else {
                    return 0
                }
            }
            set {
                if i <= 255 && i > 0 {
                    children[Int(i)] = ByteTree(byte:newValue, children:[ByteTree]())
                }
            }
        }
        
        mutating func append(byte:UInt8) -> Void {
            children.append(ByteTree(byte:byte, children:[ByteTree]()))
        }
    }
}
