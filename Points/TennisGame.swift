import Combine

class TennisGame: ObservableObject {
    @Published private(set) var points = (0, 0)
    @Published private(set) var games = (0, 0)
    @Published private(set) var sets = (0, 0)

    private var history: [ScoreSnapshot] = []

    let maxGamesPerSet: Int
    let maxSetsToWin: Int

    init(maxGamesPerSet: Int = 6, maxSetsToWin: Int = 2) {
        self.maxGamesPerSet = maxGamesPerSet
        self.maxSetsToWin = maxSetsToWin
        saveHistory()
    }

    func scorePoint(for player: Int) {
        objectWillChange.send()
        if player == 0 {
            points.0 += 1
        } else {
            points.1 += 1
        }
        checkGameWin()
        saveHistory()
    }

    func undo() {
        if history.count > 1 {
            objectWillChange.send()
            history.removeLast()
            let last = history.last!
            points = last.points
            games = last.games
            sets = last.sets
        }
    }

    private func checkGameWin() {
        let p0 = points.0
        let p1 = points.1

        if (p0 >= 4 || p1 >= 4) && abs(p0 - p1) >= 2 {
            if p0 > p1 {
                winGame(for: 0)
            } else {
                winGame(for: 1)
            }
        }
    }

    private func winGame(for player: Int) {
        points = (0, 0)
        if player == 0 {
            games.0 += 1
        } else {
            games.1 += 1
        }
        checkSetWin()
    }

    private func checkSetWin() {
        if games.0 >= maxGamesPerSet && games.0 - games.1 >= 2 {
            winSet(for: 0)
        } else if games.1 >= maxGamesPerSet && games.1 - games.0 >= 2 {
            winSet(for: 1)
        }
    }

    private func winSet(for player: Int) {
        games = (0, 0)
        if player == 0 {
            sets.0 += 1
        } else {
            sets.1 += 1
        }
    }

    private func saveHistory() {
        history.append(ScoreSnapshot(points: points, games: games, sets: sets))
    }

    func displayPoint(for player: Int) -> String {
        let p = player == 0 ? points.0 : points.1
        switch p {
        case 0: return "0"
        case 1: return "15"
        case 2: return "30"
        case 3: return "40"
        default:
            if points.0 == points.1 {
                return "40"
            } else if (player == 0 && points.0 > points.1) || (player == 1 && points.1 > points.0) {
                return "Ad"
            } else {
                return "40"
            }
        }
    }

    func currentScoreDescription() -> String {
        "Set: \(sets.0)-\(sets.1) | Game: \(games.0)-\(games.1) | Point: \(displayPoint(for: 0)) - \(displayPoint(for: 1))"
    }

    private struct ScoreSnapshot {
        let points: (Int, Int)
        let games: (Int, Int)
        let sets: (Int, Int)
    }
}
