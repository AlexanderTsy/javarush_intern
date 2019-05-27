package by.ats.entity;

import javax.persistence.*;

@Entity
@Table(name = "part")
public class Part {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false)
    private long id;
    @Column(nullable = false)
    private String name;
    @Column(name = "is_obligate", columnDefinition = "BOOLEAN NOT NULL")
    //for NOT NULL field type have to be boolean not Boolean
    // Boolean allows to set NULL
    private boolean obligate;
    @Column(columnDefinition = "INT NOT NULL")
    private int quantity;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean getObligate() {
        return obligate;
    }

    public void setObligate(boolean obligate) { this.obligate = obligate; }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
