//
//  UITableView+Extensions.swift
//  NQAL Client
//
//  Created by Islam Ahmed on 27/04/2023.
//


import UIKit
extension UITableView {
    func register<T>(cell: T.Type) where T: UITableViewCell {
        register(cell.nib, forCellReuseIdentifier: cell.cellIdentifier)
    }
    func dequeue<Cell: UITableViewCell>() -> Cell {
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {
            fatalError("Error in cell")
        }
        return cell
    }
    ///Get visible cell height
    var visibleCellsHeight: CGFloat {
        self.setNeedsLayout()
        self.layoutIfNeeded()
        return visibleCells.reduce(0) {
            $0 + $1.frame.height
        }
    }
    /// Check if cell at the specific section and row is visible
    /// - Parameters:
    /// - section: an Int reprenseting a UITableView section
    /// - row: and Int representing a UITableView row
    /// - Returns: True if cell at section and row is visible, False otherwise
    func isCellVisible(section: Int, row: Int) -> Bool {
        guard let indexes = self.indexPathsForVisibleRows else {
            return false
        }
        return indexes.contains {
            $0.section == section && $0.row == row
        }
    }
    func update(action:(()->())? = nil){
        DispatchQueue.main.async
            {
                UIView.animate(withDuration:0) {[weak self] in
                    guard let self = self else {return}
                    self.beginUpdates()
                    if let action = action {
                        action()
                    }
                    self.endUpdates()
                    self.layoutIfNeeded()
                }
        }
    }
}
extension UIResponder {
    /**
     * Returns the next responder in the responder chain cast to the given type, or
     * if nil, recurses the chain until the next responder is nil or castable.
     */
    func next<U: UIResponder>(of type: U.Type = U.self) -> U? {
        return self.next.flatMap({ $0 as? U ?? $0.next() })
    }
}
